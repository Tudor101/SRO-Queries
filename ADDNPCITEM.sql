USE SRO_VT_SHARD
GO
DECLARE @ID int
DECLARE @INDEX int
DECLARE @CodeName varchar(128)
DECLARE @PackageName varchar(128)
DECLARE @DescSTRID varchar(128)
DECLARE @File varchar(128)
DECLARE @Price int
DECLARE @SilkPrice int
DECLARE @Slot tinyint
DECLARE @TAB varchar(128)
DECLARE @Data int
DECLARE @SkipScrapOfPackageItem int = 0
DECLARE @SkipPackageItem int = 0
DECLARE @SkipPricePolicyOfItem int = 0
--- Set Variables
SET @CodeName = 'ITEM_EU_DAGGER_11_SET_B_RARE' -- Item CodeName in RefObjCommon
SET @Price = 5000000 -- Set 0 if you don't want to set Gold Price
SET @SilkPrice = 0 -- Set 0 if you don't want to set Silk Price
SET @TAB = 'STORE_MANTICORE_ITEMS_TAB1' -- Tab name in NPC, For _RefShopGoods
SET @PackageName = 'PACKAGE_'+@CodeName -- Do not edit if you don't know what are you doing.
--- you don't need to touch here...
IF (@CodeName = '')
BEGIN
    PRINT 'You have to edit CodeName..!'
    PRINT 'FAILED.'
    RETURN
END
IF ((SELECT COUNT(ID) FROM _RefObjCommon WHERE CodeName128 = @CodeName) < 1)
BEGIN
    PRINT 'There is no item with this CodeName..!'
    PRINT 'FAILED.'
    RETURN
END
IF (@Price < 0)
BEGIN
    PRINT 'Price is not VALID..!'
    PRINT 'FAILED.'
    RETURN
END
IF (@SilkPrice < 0)
BEGIN
    PRINT 'Silk Price is not VALID..!'
    PRINT 'FAILED.'
    RETURN
END
IF ((SELECT COUNT(ID) FROM _RefShopTab WHERE CodeName128 = @TAB) < 1)
BEGIN
    PRINT 'TAB VALUE IS NOT VALID..!'
    PRINT 'FAILED.'
    RETURN
END
IF ((SELECT COUNT (RefPackageItemCodeName) FROM _RefShopGoods WHERE RefPackageItemCodeName = @PackageName AND RefTabCodeName = @TAB) > 0)
BEGIN
    PRINT 'There is already same item in same tab..!'
    PRINT 'FAILED.'
    RETURN
END
IF ((SELECT COUNT (RefPackageItemCodeName) FROM _RefScrapOfPackageItem WHERE RefPackageItemCodeName = @PackageName) > 0)
BEGIN
    PRINT 'There is already an entry for this item, skipping @_RefScrapOfPackageItem table..!'
    SET @SkipScrapOfPackageItem = 1
END
IF ((SELECT COUNT (CodeName128) FROM _RefPackageItem WHERE CodeName128 = @PackageName) > 0)
BEGIN
    PRINT 'There is already an entry for this item, skipping @_RefPackageItem table..!'
    SET @SkipPackageItem = 1
END
IF ((SELECT COUNT (PaymentDevice) FROM _RefPricePolicyOfItem WHERE RefPackageItemCodeName = @PackageName AND PaymentDevice = '1') > 0)
BEGIN
    PRINT 'There is already an entry for this item with same PaymentDevice, skipping @_RefPricePolicyOfItem table..! (Gold)'
    SET @SkipPricePolicyOfItem = 1
END
IF ((SELECT COUNT (PaymentDevice) FROM _RefPricePolicyOfItem WHERE RefPackageItemCodeName = @PackageName AND PaymentDevice = '2') > 0)
BEGIN
    PRINT 'There is already an entry for this item with same PaymentDevice, skipping @_RefPricePolicyOfItem table..! (Silk)'
    IF (@SkipPricePolicyOfItem = 1)
    BEGIN
        SET @SkipPricePolicyOfItem = 3
    END
    ELSE
    BEGIN
        SET @SkipPricePolicyOfItem = 2
    END
END
IF (@SilkPrice = 0) AND (@Price = 0)
BEGIN
    PRINT 'You need to set a price, at least one !'
    PRINT 'FAILED.'
    RETURN
END
SELECT TOP 1 @ID = ID FROM _RefPackageItem ORDER BY ID DESC
SET @ID = @ID + 1
SELECT TOP 1 @INDEX = [Index] FROM _RefScrapOfPackageItem ORDER BY [Index] DESC
SET @INDEX = @INDEX + 1
SELECT TOP 1 @Slot = SlotIndex FROM _RefShopGoods WHERE RefTabCodeName = @TAB ORDER BY SlotIndex DESC
IF (@Slot = 0)
BEGIN
    SET @Slot = @Slot + 1
END
ELSE IF (@Slot > 0)
BEGIN
    SET @Slot = @Slot + 1
END
ELSE
BEGIN
    SET @Slot = 0
END
SET @DescSTRID = 'SN_' + @CodeName + '_TT_DESC'
SELECT @File = AssocFileIcon128 FROM _RefObjCommon WHERE CodeName128 = @CodeName
IF (@CodeName LIKE '%RING%' OR @CodeName LIKE '%NECKLACE%' OR @CodeName LIKE '%ARCHEMY%')
BEGIN
    SET @Data = 1
END
ELSE
BEGIN
    SELECT @Data = Dur_U FROM _RefObjItem WHERE ID = (SELECT Link FROM _RefObjCommon WHERE CodeName128 = @CodeName)
END
BEGIN TRANSACTION
IF (@SkipPackageItem = 0)
BEGIN
    SET IDENTITY_INSERT _RefPackageItem ON
    INSERT _RefPackageItem ([Service], Country, ID, CodeName128, SaleTag, ExpandTerm, NameStrID, DescStrID, AssocFileIcon, Param1, Param1_Desc128, Param2, Param2_Desc128, Param3, Param3_Desc128, Param4, Param4_Desc128) VALUES (1, 15, @ID, @PackageName, 0, 'EXPAND_TERM_ALL', 'SN_'+@CodeName, @DescSTRID, @File, -1, 'xxx', -1, 'xxx', -1, 'xxx', -1, 'xxx')
        IF (@@ERROR <> 0)  
        BEGIN
            PRINT 'AN ERROR HAPPENED WHILE ADDING TO _RefPackageItem, Rolling back...'
            ROLLBACK TRANSACTION
            RETURN
        END
    PRINT 'Added to _RefPackageItem !'
    SET IDENTITY_INSERT _RefPackageItem OFF
END
IF (@SkipScrapOfPackageItem = 0)
BEGIN
	SET IDENTITY_INSERT _RefScrapOfPackageItem ON
    INSERT _RefScrapOfPackageItem (Service, Country, RefPackageItemCodeName, RefItemCodeName, OptLevel, Variance, Data, MagParamNum, MagParam1, MagParam2, MagParam3, MagParam4, MagParam5, MagParam6, MagParam7, MagParam8, MagParam9, MagParam10, MagParam11, MagParam12, Param1, Param1_Desc128, Param2, Param2_Desc128, Param3, Param3_Desc128, Param4, Param4_Desc128, [Index]) VALUES (1, 15, @PackageName, @CodeName, 0, 0, @Data, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'xxx', -1, 'xxx', -1, 'xxx', -1, 'xxx', @INDEX)
        IF (@@ERROR <> 0)  
        BEGIN
            PRINT 'AN ERROR HAPPENED WHILE ADDING TO _RefScrapOfPackageItem, Rolling back...'
            ROLLBACK TRANSACTION
            RETURN
        END
    PRINT 'Added to _RefScrapOfPackageItem !'
	SET IDENTITY_INSERT _RefScrapOfPackageItem OFF
END
IF (@SkipPricePolicyOfItem = 2 OR @SkipPricePolicyOfItem = 0 AND @Price > 0)
BEGIN
    INSERT _RefPricePolicyOfItem (Service, Country, RefPackageItemCodeName, PaymentDevice, PreviousCost, Cost, Param1, Param1_Desc128, Param2, Param2_Desc128, Param3, Param3_Desc128, Param4, Param4_Desc128) VALUES (1, 15, @PackageName, 1, 0, @Price, -1, 'xxx', -1, 'xxx', -1, 'xxx', -1, 'xxx')
        IF (@@ERROR <> 0)  
        BEGIN
            PRINT 'AN ERROR HAPPENED WHILE ADDING TO _RefPricePolicyOfItem, Rolling back...'
            ROLLBACK TRANSACTION
            RETURN
        END
    PRINT 'Added to _RefPricePolicyOfItem, PaymentDevice = 1 (Gold)'
END
IF (@SkipPricePolicyOfItem = 1 OR @SkipPricePolicyOfItem = 0 AND @SilkPrice > 0)
BEGIN
    INSERT _RefPricePolicyOfItem (Service, Country, RefPackageItemCodeName, PaymentDevice, PreviousCost, Cost, Param1, Param1_Desc128, Param2, Param2_Desc128, Param3, Param3_Desc128, Param4, Param4_Desc128) VALUES (1, 15, @PackageName, 2, 0, @SilkPrice, -1, 'xxx', -1, 'xxx', -1, 'xxx', -1, 'xxx')
        IF (@@ERROR <> 0)  
        BEGIN
            PRINT 'AN ERROR HAPPENED WHILE ADDING TO _RefPricePolicyOfItem, Rolling back...'
            ROLLBACK TRANSACTION
            RETURN
        END
    PRINT 'Added to _RefPricePolicyOfItem, PaymentDevice = 2 (Silk)'
END
ELSE
BEGIN
    PRINT 'There is already silk / gold price, skipping _RefPricePolicyOfItem table...'
END
INSERT _RefShopGoods (Service, Country, RefTabCodeName, RefPackageItemCodeName, SlotIndex, Param1, Param1_Desc128, Param2, Param2_Desc128, Param3, Param3_Desc128, Param4, Param4_Desc128) VALUES (1, 15, @TAB, @PackageName, @Slot, -1, 'xxx', -1, 'xxx', -1, 'xxx', -1, 'xxx')
    IF (@@ERROR <> 0)  
    BEGIN
        PRINT 'An error happened while adding to _RefShopGoods table'
        PRINT 'FAILED.'
        ROLLBACK TRANSACTION
        RETURN
    END
    PRINT 'Added to _RefShopGoods, DONE!'
COMMIT TRANSACTION 