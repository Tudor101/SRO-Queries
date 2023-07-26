--Add New Npc By MyVsro Team
Use SRO_VT_SHARD --<< dataBase Name <<<<
Go
Declare 
@NpcCodeName varchar(60),	@ID	  INT,			@CodeName128 varchar(128),		@NameStrID128 varchar(128), 
@Link INT,					@ShopID int,		@CountGroups smallint,
@ShopGroupID1 int,			@ShopGroupID2 int,	@ShopGroupID3 int,				@ShopGroupID4 int,
@ShopItemGroupID1 int,		@ShopItemGroupID2 int,@ShopItemGroupID3 int,		@ShopItemGroupID4 int,
@CountTabGroup1 smallint,	@CountTabGroup2 smallint,@CountTabGroup3 smallint,	@CountTabGroup4 smallint,
@ShopTab1Group1 int,		@ShopTab2Group1 int,	@ShopTab3Group1 int,		@ShopTab4Group1 int,
@ShopTab1Group2 int,		@ShopTab2Group2 int,	@ShopTab3Group2 int,		@ShopTab4Group2 int,
@ShopTab1Group3 int,		@ShopTab2Group3 int,	@ShopTab3Group3 int,		@ShopTab4Group3 int,
@ShopTab1Group4 int,		@ShopTab2Group4 int,	@ShopTab3Group4 int,		@ShopTab4Group4 int,
@ShoptabGroupID1 int,		@ShoptabGroupID2 int,	@ShoptabGroupID3 int,		@ShoptabGroupID4 int,
@HiveID int,				@TacticsID int,			@NestID int,				@CharnameLocation varchar(64),
@WorldID smallint,			@RegionID smallint,		@PosX real,					@PosY real,			@PosZ real,
@NpcLooking smallint
----------------------------Setting---------------------------------
Set @NpcCodeName ='MANTICORE_ITEMS' --<--Please Type Name Capital
Set @CharnameLocation = 'wepboi' --<-- Charname Location
Set @NpcLooking = 0  --<-- West = -32767 South = -16384 Earth = 0 North = +16,384 --
Set @CountGroups = 2 ---<----Count of Groups  Max {4 Groups}
Set @CountTabGroup1 = 4 ----<----Count Tabs in Group {1} Max {4 tabs}
Set @CountTabGroup2 = 4 ----<----Count Tabs in Group {2} If Exists  Max {4 tabs}
Set @CountTabGroup3 = 4 ----<----Count Tabs in Group {3} If Exists Max {4 tabs}
Set @CountTabGroup4 = 4 ----<----Count Tabs in Group {4} If Exists Max {4 tabs}
----------------------------Setting End

-------------------------------------Dont Change Any Thing more
Set @ID = (Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefObjCommon)
Set @CodeName128 = 'NPC_'+@NpcCodeName+''
Set @NameStrID128 = 'SN_NPC_'+@NpcCodeName+''
Set @Link = (Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefObjChar)
Set @ShopID = (Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefShop)
Set @ShopGroupID1 = (Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefShopGroup)
Set @ShopGroupID2 = (Select Max(ID)+2 From SRO_VT_SHARD.dbo._RefShopGroup)
Set @ShopGroupID3 = (Select Max(ID)+3 From SRO_VT_SHARD.dbo._RefShopGroup)
Set @ShopGroupID4 = (Select Max(ID)+4 From SRO_VT_SHARD.dbo._RefShopGroup)
Set @ShopItemGroupID1 = (Select Max(GroupID)+1 From SRO_VT_SHARD.dbo._RefShopItemGroup)
Set @ShopItemGroupID2 = (Select Max(GroupID)+2 From SRO_VT_SHARD.dbo._RefShopItemGroup)
Set @ShopItemGroupID3 = (Select Max(GroupID)+3 From SRO_VT_SHARD.dbo._RefShopItemGroup)
Set @ShopItemGroupID4 = (Select Max(GroupID)+4 From SRO_VT_SHARD.dbo._RefShopItemGroup)
Set @ShopTab1Group1	=(Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab2Group1	=(Select Max(ID)+2 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab3Group1	=(Select Max(ID)+3 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab4Group1	=(Select Max(ID)+4 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab1Group2	=(Select Max(ID)+5 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab2Group2	=(Select Max(ID)+6 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab3Group2	=(Select Max(ID)+7 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab4Group2	=(Select Max(ID)+8 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab1Group3	=(Select Max(ID)+9 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab2Group3	=(Select Max(ID)+10 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab3Group3	=(Select Max(ID)+11 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab4Group3	=(Select Max(ID)+12 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab1Group4	=(Select Max(ID)+13 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab2Group4	=(Select Max(ID)+14 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab3Group4	=(Select Max(ID)+15 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShopTab4Group4	=(Select Max(ID)+16 From SRO_VT_SHARD.dbo._RefShopTab)
Set @ShoptabGroupID1 = (Select Max(ID)+1 From SRO_VT_SHARD.dbo._RefShopTabGroup)
Set @ShoptabGroupID2 = (Select Max(ID)+2 From SRO_VT_SHARD.dbo._RefShopTabGroup)
Set @ShoptabGroupID3 = (Select Max(ID)+3 From SRO_VT_SHARD.dbo._RefShopTabGroup)
Set @ShoptabGroupID4 = (Select Max(ID)+4 From SRO_VT_SHARD.dbo._RefShopTabGroup)
Set @HiveID = (Select Max(dwHiveID)+1 From SRO_VT_SHARD.dbo.Tab_RefHive)
Set @TacticsID = (Select Max(dwTacticsID)+1 From SRO_VT_SHARD.dbo.Tab_RefTactics)
Set @NestID = (Select Max(dwNestID)+1 From SRO_VT_SHARD.dbo.Tab_RefNest)
Set @WorldID = (Select WorldID From SRO_VT_SHARD.dbo._Char Where CharName16 = @CharnameLocation)
Set @RegionID = (Select LatestRegion From SRO_VT_SHARD.dbo._Char Where CharName16 = @CharnameLocation)
Set @PosX = (Select PosX From SRO_VT_SHARD.dbo._Char Where CharName16 = @CharnameLocation)
Set @PosY = (Select PosY From SRO_VT_SHARD.dbo._Char Where CharName16 = @CharnameLocation)
Set @PosZ = (Select PosZ From SRO_VT_SHARD.dbo._Char Where CharName16 = @CharnameLocation)
---------------------------------------------------------------------------------------------
IF Not EXISTS (Select * From _RefObjCommon Where CodeName128 = @CodeName128)
BEGIN
----------------------------Print side to media-------------------------------------------
Print '
Media Side
characterdata_xxx
1	' + CAST(@ID AS NVARCHAR) + '	'+@CodeName128+'	xxx	xxx	'+@NameStrID128+'	xxx	0	1	1	2	2	0	5000	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	-1	0	-1	0	-1	0	-1	0	0	0	0	0	0	0	100	0	0	0	npc\npc\khotansystem_turtleshipticketagent.bsr	xxx	xxx	xxx	xxx	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	336860180	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
----------------
RefShop
1	15	' + CAST(@ShopID AS NVARCHAR) + '	STORE_'+@NpcCodeName+'	-1	xxx	-1	xxx	-1	xxx	-1	xxx
--------------------'
IF @CountGroups >= 1
BEGIN
Print'
RefShopGroup
1	15	' + CAST(@ShopGroupID1 AS NVARCHAR) + '	GROUP1_STORE_'+@NpcCodeName+'	'+@CodeName128+'	-1	xxx	-1	xxx	-1	xxx	-1	xxx'
END
IF @CountGroups >= 2
BEGIN
Print'1	15	' + CAST(@ShopGroupID2 AS NVARCHAR) + '	GROUP2_STORE_'+@NpcCodeName+'	'+@CodeName128+'	-1	xxx	-1	xxx	-1	xxx	-1	xxx'
END
IF @CountGroups >= 3
BEGIN
Print'1	15	' + CAST(@ShopGroupID3 AS NVARCHAR) + '	GROUP3_STORE_'+@NpcCodeName+'	'+@CodeName128+'	-1	xxx	-1	xxx	-1	xxx	-1	xxx'
END
IF @CountGroups >= 4
BEGIN
Print'1	15	' + CAST(@ShopGroupID4 AS NVARCHAR) + '	GROUP4_STORE_'+@NpcCodeName+'	'+@CodeName128+'	-1	xxx	-1	xxx	-1	xxx	-1	xxx'
END
IF @CountGroups >= 1
BEGIN
Print'----------------------------
ShopGroupData
1	' + CAST(@ShopItemGroupID1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_GROUP1'
END
IF @CountGroups >= 2
BEGIN
Print'1	' + CAST(@ShopItemGroupID2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_GROUP2'
END
IF @CountGroups >= 3
BEGIN
Print'1	' + CAST(@ShopItemGroupID3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_GROUP3'
END
IF @CountGroups >= 4
BEGIN
Print'1	' + CAST(@ShopItemGroupID4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_GROUP4'
END
IF @CountGroups >= 1
BEGIN
Print'-------------------
refshoptabgroup
1	15	' + CAST(@ShoptabGroupID1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_GROUP1'
END
IF @CountGroups >= 2
BEGIN
Print'1	15	' + CAST(@ShoptabGroupID2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_GROUP2'
END
IF @CountGroups >= 3
BEGIN
Print'1	15	' + CAST(@ShoptabGroupID3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_GROUP3'
END
IF @CountGroups >= 4
BEGIN
Print'1	15	' + CAST(@ShoptabGroupID4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_GROUP4'
END
IF @CountGroups >= 1
BEGIN
Print'-------------------------
refmappingshopgroup
1	15	GROUP1_STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+''
END
IF @CountGroups >= 2
BEGIN
Print'1	15	GROUP2_STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+''
END
IF @CountGroups >= 3
BEGIN
Print'1	15	GROUP3_STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+''
END
IF @CountGroups >= 4
BEGIN
Print'1	15	GROUP4_STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+''
END
IF @CountGroups >= 1
BEGIN
Print'--------------------------
refmappingshopwithtab
1	15	STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+'_GROUP1'
END
IF @CountGroups >= 2
BEGIN
Print'1	15	STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+'_GROUP2'
END
IF @CountGroups >= 3
BEGIN
Print'1	15	STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+'_GROUP3'
END
IF @CountGroups >= 4
BEGIN
Print'1	15	STORE_'+@NpcCodeName+'	STORE_'+@NpcCodeName+'_GROUP4'
END
IF @CountGroups >= 1
BEGIN
IF @CountTabGroup1 >=1
BEGIN
Print'---------------------------
refshoptab
1	15	' + CAST(@ShopTab1Group1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_TAB1	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_TAB1'
END
IF @CountTabGroup1 >=2
BEGIN
Print'1	15	' + CAST(@ShopTab2Group1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_TAB2	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_TAB2'
END
IF @CountTabGroup1 >=3
BEGIN
Print'1	15	' + CAST(@ShopTab3Group1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_TAB3	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_TAB3'
END
IF @CountTabGroup1 >=4
BEGIN
Print'1	15	' + CAST(@ShopTab4Group1 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_TAB4	STORE_'+@NpcCodeName+'_GROUP1	SN_STORE_'+@NpcCodeName+'_TAB4'
END
END
IF @CountGroups >= 2
BEGIN
IF @CountTabGroup2 >=1
BEGIN
Print'1	15	' + CAST(@ShopTab1Group2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G2_TAB1	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_G2_TAB1'
END
IF @CountTabGroup2 >=2
BEGIN
Print'1	15	' + CAST(@ShopTab2Group2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G2_TAB2	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_G2_TAB2'
END
IF @CountTabGroup2 >=3
BEGIN
Print'1	15	' + CAST(@ShopTab3Group2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G2_TAB3	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_G2_TAB3'
END
IF @CountTabGroup2 >=4
BEGIN
Print'1	15	' + CAST(@ShopTab4Group2 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G2_TAB4	STORE_'+@NpcCodeName+'_GROUP2	SN_STORE_'+@NpcCodeName+'_G2_TAB4'
END
END
IF @CountGroups >= 3
BEGIN
IF @CountTabGroup3 >=1
BEGIN
Print'1	15	' + CAST(@ShopTab1Group3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G3_TAB1	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_G3_TAB1'
END
IF @CountTabGroup3 >=2
BEGIN
Print'1	15	' + CAST(@ShopTab2Group3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G3_TAB2	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_G3_TAB2'
END
IF @CountTabGroup3 >=3
BEGIN
Print'1	15	' + CAST(@ShopTab3Group3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G3_TAB3	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_G3_TAB3'
END
IF @CountTabGroup3 >=4
BEGIN
Print'1	15	' + CAST(@ShopTab4Group3 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G3_TAB4	STORE_'+@NpcCodeName+'_GROUP3	SN_STORE_'+@NpcCodeName+'_G3_TAB4'
END
END
IF @CountGroups >= 4
BEGIN
IF @CountTabGroup4 >=1
BEGIN
Print'1	15	' + CAST(@ShopTab1Group4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G4_TAB1	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_G4_TAB1'
END
IF @CountTabGroup4 >=2
BEGIN
Print'1	15	' + CAST(@ShopTab2Group4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G4_TAB2	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_G4_TAB2'
END
IF @CountTabGroup4 >=3
BEGIN
Print'1	15	' + CAST(@ShopTab3Group4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G4_TAB3	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_G4_TAB3'
END
IF @CountTabGroup4 >=4
BEGIN
Print'1	15	' + CAST(@ShopTab4Group4 AS NVARCHAR) + '	STORE_'+@NpcCodeName+'_G4_TAB4	STORE_'+@NpcCodeName+'_GROUP4	SN_STORE_'+@NpcCodeName+'_G4_TAB4'
END
END
Print '-------------------------------
textdata_object
1	'+@NameStrID128+'								NPC Name
-----------
textquest_speech&name
1	'+@NameStrID128+'_BS	??? ?? ?? ??? ??? ?????…	0	0	0	0	0	Best Challenge that make game More fun Now Want see who the Best .. (MyvsroTeam)…	Best Challenge that make game More fun Now Want see who the Best .. (MyvsroTeam)…	0	0	0	0	0	0
--------------
npcchat
1	'+@CodeName128+'	'+@NameStrID128+'_BS	'+@NameStrID128+'_PS
------------------
textuisystem
'
IF @CountGroups >= 1
BEGIN
Print'1	SN_STORE_'+@NpcCodeName+'_GROUP1	?? ??? ??? ??/??	0	0	0	0	0	0	Group1Name  	0	0	0	0	0	0	0	0'
END
IF @CountGroups >= 2
BEGIN
Print'1	SN_STORE_'+@NpcCodeName+'_GROUP2	?? ??? ??? ??/??	0	0	0	0	0	0	Group2Name  	0	0	0	0	0	0	0	0'
END
IF @CountGroups >= 3
BEGIN
Print'1	SN_STORE_'+@NpcCodeName+'_GROUP3	?? ??? ??? ??/??	0	0	0	0	0	0	Group3Name  	0	0	0	0	0	0	0	0'
END
IF @CountGroups >= 4
BEGIN
Print'1	SN_STORE_'+@NpcCodeName+'_GROUP4	?? ??? ??? ??/??	0	0	0	0	0	0	Group4Name  	0	0	0	0	0	0	0	0'
END
IF @CountGroups >= 1
BEGIN
IF @CountTabGroup1 >=1
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_TAB1	??	0	0	0	0	0	0	Tab1Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup1 >=2
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_TAB2	??	0	0	0	0	0	0	Tab2Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup1 >=3
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_TAB3	??	0	0	0	0	0	0	Tab3Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup1 >=4
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_TAB4	??	0	0	0	0	0	0	Tab4Name	0	0	0	0	0	0	0	0	'
END
END
IF @CountGroups >= 2
BEGIN
IF @CountTabGroup2 >=1
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G2_TAB1	??	0	0	0	0	0	0	Tab1G2Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup2 >=2
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G2_TAB2	??	0	0	0	0	0	0	Tab2G2Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup2 >=3
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G2_TAB3	??	0	0	0	0	0	0	Tab3G2Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup2 >=4
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G2_TAB4	??	0	0	0	0	0	0	Tab4G2Name	0	0	0	0	0	0	0	0	'
END
END
IF @CountGroups >= 3
BEGIN
IF @CountTabGroup3 >=1
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G3_TAB1	??	0	0	0	0	0	0	Tab1G3Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup3 >=2
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G3_TAB2	??	0	0	0	0	0	0	Tab2G3Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup3 >=3
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G3_TAB3	??	0	0	0	0	0	0	Tab3G3Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup3 >=4
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G3_TAB4	??	0	0	0	0	0	0	Tab4G3Name	0	0	0	0	0	0	0	0	'
END
END
IF @CountGroups >= 4
BEGIN
IF @CountTabGroup4 >=1
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G4_TAB1	??	0	0	0	0	0	0	Tab1G4Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup4 >=2
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G4_TAB2	??	0	0	0	0	0	0	Tab2G4Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup4 >=3
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G4_TAB3	??	0	0	0	0	0	0	Tab3G4Name	0	0	0	0	0	0	0	0	'
END
IF @CountTabGroup4 >=4
BEGIN
Print '1	SN_STORE_'+@NpcCodeName+'_G4_TAB4	??	0	0	0	0	0	0	Tab4G4Name	0	0	0	0	0	0	0	0	'
END
END
---------------------------------end Print----------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefObjCommon'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefObjCommon] ON 
INSERT [dbo].[_RefObjCommon] ([Service], [ID], [CodeName128], [ObjName128], [OrgObjCodeName128], [NameStrID128], [DescStrID128], [CashItem], [Bionic], [TypeID1], [TypeID2], [TypeID3], [TypeID4], [DecayTime], [Country], [Rarity], [CanTrade], [CanSell], [CanBuy], [CanBorrow], [CanDrop], [CanPick], [CanRepair], [CanRevive], [CanUse], [CanThrow], [Price], [CostRepair], [CostRevive], [CostBorrow], [KeepingFee], [SellPrice], [ReqLevelType1], [ReqLevel1], [ReqLevelType2], [ReqLevel2], [ReqLevelType3], [ReqLevel3], [ReqLevelType4], [ReqLevel4], [MaxContain], [RegionID], [Dir], [OffsetX], [OffsetY], [OffsetZ], [Speed1], [Speed2], [Scale], [BCHeight], [BCRadius], [EventID], [AssocFileObj128], [AssocFileDrop128], [AssocFileIcon128], [AssocFile1_128], [AssocFile2_128], [Link]) VALUES (1, @ID, @CodeName128,'xxx','xxx',@NameStrID128,'xxx', 0, 1, 1, 2, 2, 0, 5000, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0,'npc\npc\khotansystem_turtleshipticketagent.bsr','xxx','xxx','xxx','xxx',@Link)
SET IDENTITY_INSERT [dbo].[_RefObjCommon] OFF 
END ELSE BEGIN
INSERT [dbo].[_RefObjCommon] ([Service], [ID], [CodeName128], [ObjName128], [OrgObjCodeName128], [NameStrID128], [DescStrID128], [CashItem], [Bionic], [TypeID1], [TypeID2], [TypeID3], [TypeID4], [DecayTime], [Country], [Rarity], [CanTrade], [CanSell], [CanBuy], [CanBorrow], [CanDrop], [CanPick], [CanRepair], [CanRevive], [CanUse], [CanThrow], [Price], [CostRepair], [CostRevive], [CostBorrow], [KeepingFee], [SellPrice], [ReqLevelType1], [ReqLevel1], [ReqLevelType2], [ReqLevel2], [ReqLevelType3], [ReqLevel3], [ReqLevelType4], [ReqLevel4], [MaxContain], [RegionID], [Dir], [OffsetX], [OffsetY], [OffsetZ], [Speed1], [Speed2], [Scale], [BCHeight], [BCRadius], [EventID], [AssocFileObj128], [AssocFileDrop128], [AssocFileIcon128], [AssocFile1_128], [AssocFile2_128], [Link]) VALUES (1, @ID, @CodeName128,'xxx','xxx',@NameStrID128,'xxx', 0, 1, 1, 2, 2, 0, 5000, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0,'npc\npc\khotansystem_turtleshipticketagent.bsr','xxx','xxx','xxx','xxx',@Link)
END
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefObjChar'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefObjChar] ON 
INSERT [dbo].[_RefObjChar] ([ID], [Lvl], [CharGender], [MaxHP], [MaxMP], [ResistFrozen], [ResistFrostbite], [ResistBurn], [ResistEShock], [ResistPoison], [ResistZombie], [ResistSleep], [ResistRoot], [ResistSlow], [ResistFear], [ResistMyopia], [ResistBlood], [ResistStone], [ResistDark], [ResistStun], [ResistDisea], [ResistChaos], [ResistCsePD], [ResistCseMD], [ResistCseSTR], [ResistCseINT], [ResistCseHP], [ResistCseMP], [Resist24], [ResistBomb], [Resist26], [Resist27], [Resist28], [Resist29], [Resist30], [Resist31], [Resist32], [InventorySize], [CanStore_TID1], [CanStore_TID2], [CanStore_TID3], [CanStore_TID4], [CanBeVehicle], [CanControl], [DamagePortion], [MaxPassenger], [AssocTactics], [PD], [MD], [PAR], [MAR], [ER], [BR], [HR], [CHR], [ExpToGive], [CreepType], [Knockdown], [KO_RecoverTime], [DefaultSkill_1], [DefaultSkill_2], [DefaultSkill_3], [DefaultSkill_4], [DefaultSkill_5], [DefaultSkill_6], [DefaultSkill_7], [DefaultSkill_8], [DefaultSkill_9], [DefaultSkill_10], [TextureType], [Except_1], [Except_2], [Except_3], [Except_4], [Except_5], [Except_6], [Except_7], [Except_8], [Except_9], [Except_10], [Link]) VALUES (@Link, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336860180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[_RefObjChar] OFF 
END ELSE BEGIN
INSERT [dbo].[_RefObjChar] ([ID], [Lvl], [CharGender], [MaxHP], [MaxMP], [ResistFrozen], [ResistFrostbite], [ResistBurn], [ResistEShock], [ResistPoison], [ResistZombie], [ResistSleep], [ResistRoot], [ResistSlow], [ResistFear], [ResistMyopia], [ResistBlood], [ResistStone], [ResistDark], [ResistStun], [ResistDisea], [ResistChaos], [ResistCsePD], [ResistCseMD], [ResistCseSTR], [ResistCseINT], [ResistCseHP], [ResistCseMP], [Resist24], [ResistBomb], [Resist26], [Resist27], [Resist28], [Resist29], [Resist30], [Resist31], [Resist32], [InventorySize], [CanStore_TID1], [CanStore_TID2], [CanStore_TID3], [CanStore_TID4], [CanBeVehicle], [CanControl], [DamagePortion], [MaxPassenger], [AssocTactics], [PD], [MD], [PAR], [MAR], [ER], [BR], [HR], [CHR], [ExpToGive], [CreepType], [Knockdown], [KO_RecoverTime], [DefaultSkill_1], [DefaultSkill_2], [DefaultSkill_3], [DefaultSkill_4], [DefaultSkill_5], [DefaultSkill_6], [DefaultSkill_7], [DefaultSkill_8], [DefaultSkill_9], [DefaultSkill_10], [TextureType], [Except_1], [Except_2], [Except_3], [Except_4], [Except_5], [Except_6], [Except_7], [Except_8], [Except_9], [Except_10], [Link]) VALUES (@Link, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336860180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
END
IF OBJECTPROPERTY(OBJECT_ID('dbo.Tab_RefTactics'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[Tab_RefTactics] ON 
INSERT [dbo].[Tab_RefTactics] ([dwTacticsID], [dwObjID], [btAIQoS], [nMaxStamina], [btMaxStaminaVariance], [nSightRange], [btAggressType], [AggressData], [btChangeTarget], [btHelpRequestTo], [btHelpResponseTo], [btBattleStyle], [BattleStyleData], [btDiversionBasis], [DiversionBasisData1], [DiversionBasisData2], [DiversionBasisData3], [DiversionBasisData4], [DiversionBasisData5], [DiversionBasisData6], [DiversionBasisData7], [DiversionBasisData8], [btDiversionKeepBasis], [DiversionKeepBasisData1], [DiversionKeepBasisData2], [DiversionKeepBasisData3], [DiversionKeepBasisData4], [DiversionKeepBasisData5], [DiversionKeepBasisData6], [DiversionKeepBasisData7], [DiversionKeepBasisData8], [btKeepDistance], [KeepDistanceData], [btTraceType], [btTraceBoundary], [TraceData], [btHomingType], [HomingData], [btAggressTypeOnHoming], [btFleeType], [dwChampionTacticsID], [AdditionOptionFlag], [szDescString128]) VALUES (@TacticsID, @ID, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,@CodeName128)
SET IDENTITY_INSERT [dbo].[Tab_RefTactics] OFF
END ELSE BEGIN
INSERT [dbo].[Tab_RefTactics] ([dwTacticsID], [dwObjID], [btAIQoS], [nMaxStamina], [btMaxStaminaVariance], [nSightRange], [btAggressType], [AggressData], [btChangeTarget], [btHelpRequestTo], [btHelpResponseTo], [btBattleStyle], [BattleStyleData], [btDiversionBasis], [DiversionBasisData1], [DiversionBasisData2], [DiversionBasisData3], [DiversionBasisData4], [DiversionBasisData5], [DiversionBasisData6], [DiversionBasisData7], [DiversionBasisData8], [btDiversionKeepBasis], [DiversionKeepBasisData1], [DiversionKeepBasisData2], [DiversionKeepBasisData3], [DiversionKeepBasisData4], [DiversionKeepBasisData5], [DiversionKeepBasisData6], [DiversionKeepBasisData7], [DiversionKeepBasisData8], [btKeepDistance], [KeepDistanceData], [btTraceType], [btTraceBoundary], [TraceData], [btHomingType], [HomingData], [btAggressTypeOnHoming], [btFleeType], [dwChampionTacticsID], [AdditionOptionFlag], [szDescString128]) VALUES (@TacticsID, @ID, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,@CodeName128)
END
IF OBJECTPROPERTY(OBJECT_ID('dbo.Tab_RefHive'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[Tab_RefHive] ON 
INSERT [dbo].[Tab_RefHive] ([dwHiveID], [btKeepMonsterCountType], [dwOverwriteMaxTotalCount], [fMonsterCountPerPC], [dwSpawnSpeedIncreaseRate], [dwMaxIncreaseRate], [btFlag], [GameWorldID], [HatchObjType], [szDescString128]) VALUES (@HiveID, 0, 0, 0, 0, 0, 0,@WorldID, 2,@CodeName128)
SET IDENTITY_INSERT [dbo].[Tab_RefHive] OFF
END ELSE BEGIN
INSERT [dbo].[Tab_RefHive] ([dwHiveID], [btKeepMonsterCountType], [dwOverwriteMaxTotalCount], [fMonsterCountPerPC], [dwSpawnSpeedIncreaseRate], [dwMaxIncreaseRate], [btFlag], [GameWorldID], [HatchObjType], [szDescString128]) VALUES (@HiveID, 0, 0, 0, 0, 0, 0,@WorldID, 2,@CodeName128)
END
IF OBJECTPROPERTY(OBJECT_ID('dbo.Tab_RefNest'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[Tab_RefNest] ON 
INSERT [dbo].[Tab_RefNest] ([dwNestID], [dwHiveID], [dwTacticsID], [nRegionDBID], [fLocalPosX], [fLocalPosY], [fLocalPosZ], [wInitialDir], [nRadius], [nGenerateRadius], [nChampionGenPercentage], [dwDelayTimeMin], [dwDelayTimeMax], [dwMaxTotalCount], [btFlag], [btRespawn], [btType]) VALUES (@NestID, @HiveID, @TacticsID, @RegionID, @PosX, @PosY, @PosZ, @NPCLooking, 0, 0, 0, 0, 0, 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Tab_RefNest] OFF
END ELSE BEGIN
INSERT [dbo].[Tab_RefNest] ([dwNestID], [dwHiveID], [dwTacticsID], [nRegionDBID], [fLocalPosX], [fLocalPosY], [fLocalPosZ], [wInitialDir], [nRadius], [nGenerateRadius], [nChampionGenPercentage], [dwDelayTimeMin], [dwDelayTimeMax], [dwMaxTotalCount], [btFlag], [btRespawn], [btType]) VALUES (@NestID, @HiveID, @TacticsID, @RegionID, @PosX, @PosY, @PosZ, @NPCLooking, 0, 0, 0, 0, 0, 1, 0, 1, 0)
END
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefShop'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefShop] ON 
INSERT [dbo].[_RefShop] ([Service], [Country], [ID], [CodeName128], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15,@ShopID, 'STORE_'+@NpcCodeName+'', -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
SET IDENTITY_INSERT [dbo].[_RefShop] OFF 
END ELSE BEGIN
INSERT [dbo].[_RefShop] ([Service], [Country], [ID], [CodeName128], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15,@ShopID, 'STORE_'+@NpcCodeName+'', -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefShopGroup'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefShopGroup] ON 
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID1,'GROUP1_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID2,'GROUP2_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID3,'GROUP3_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID4,'GROUP4_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
SET IDENTITY_INSERT [dbo].[_RefShopGroup] OFF 
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID1,'GROUP1_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID2,'GROUP2_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID3,'GROUP3_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopGroup] ([Service], [Country], [ID], [CodeName128], [RefNPCCodeName], [Param1], [Param1_Desc128], [Param2], [Param2_Desc128], [Param3], [Param3_Desc128], [Param4], [Param4_Desc128]) VALUES (1, 15, @ShopGroupID4,'GROUP4_STORE_'+@NpcCodeName+'',@CodeName128, -1,'xxx', -1,'xxx', -1,'xxx', -1,'xxx')
END
END
-------------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefShopItemGroup'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefShopItemGroup] ON 
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID1,'STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID2,'STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID3,'STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID4,'STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_GROUP4')
END
SET IDENTITY_INSERT [dbo].[_RefShopItemGroup] OFF 
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID1,'STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID2,'STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID3,'STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopItemGroup] ([Service], [GroupID], [CodeName128], [StrID128_Group]) VALUES (1, @ShopItemGroupID4,'STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_GROUP4')
END
END
------------------------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefShopTabGroup'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefShopTabGroup] ON 
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID1,'STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID2,'STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID3,'STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID4,'STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_GROUP4')
END
SET IDENTITY_INSERT [dbo].[_RefShopTabGroup] OFF 
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID1,'STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID2,'STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID3,'STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefShopTabGroup] ([Service], [Country], [ID], [CodeName128], [StrID128_Group]) VALUES (1, 15, @ShoptabGroupID4,'STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_GROUP4')
END
END
------------------------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefMappingShopGroup'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefMappingShopGroup] ON 
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP1_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP2_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP3_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP4_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
SET IDENTITY_INSERT [dbo].[_RefMappingShopGroup] OFF 
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP1_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP2_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP3_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefMappingShopGroup] ([Service], [Country], [RefShopGroupCodeName], [RefShopCodeName]) VALUES (1, 15, 'GROUP4_STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'')
END
END
----------------------------------------------------------------------------------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefMappingShopWithTab'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefMappingShopWithTab] ON 
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP4')
END
SET IDENTITY_INSERT [dbo].[_RefMappingShopWithTab] OFF 
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP1')
END
IF @CountGroups >= 2
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP2')
END
IF @CountGroups >= 3
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP3')
END
IF @CountGroups >= 4
BEGIN
INSERT [dbo].[_RefMappingShopWithTab] ([Service], [Country], [RefShopCodeName], [RefTabGroupCodeName]) VALUES (1, 15,'STORE_'+@NpcCodeName+'','STORE_'+@NpcCodeName+'_GROUP4')
END
END
----------------------------------------------------------------------------------------------------------------------------
IF OBJECTPROPERTY(OBJECT_ID('dbo._RefShopTab'), 'TableHasIdentity') = 1
BEGIN
SET IDENTITY_INSERT [dbo].[_RefShopTab] ON 
IF @CountGroups >= 1
BEGIN
IF @CountTabGroup1 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group1,'STORE_'+@NpcCodeName+'_TAB1','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB1')
END
IF @CountTabGroup1 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group1,'STORE_'+@NpcCodeName+'_TAB2','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB2')
END
IF @CountTabGroup1 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group1,'STORE_'+@NpcCodeName+'_TAB3','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB3')
END
IF @CountTabGroup1 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group1,'STORE_'+@NpcCodeName+'_TAB4','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB4')
END
END
IF @CountGroups >= 2
BEGIN
IF @CountTabGroup2 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group2,'STORE_'+@NpcCodeName+'_G2_TAB1','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB1')
END
IF @CountTabGroup2 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group2,'STORE_'+@NpcCodeName+'_G2_TAB2','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB2')
END
IF @CountTabGroup2 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group2,'STORE_'+@NpcCodeName+'_G2_TAB3','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB3')
END
IF @CountTabGroup2 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group2,'STORE_'+@NpcCodeName+'_G2_TAB4','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB4')
END
END
IF @CountGroups >= 3
BEGIN
IF @CountTabGroup3 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group3,'STORE_'+@NpcCodeName+'_G3_TAB1','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB1')
END
IF @CountTabGroup3 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group3,'STORE_'+@NpcCodeName+'_G3_TAB2','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB2')
END
IF @CountTabGroup3 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group3,'STORE_'+@NpcCodeName+'_G3_TAB3','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB3')
END
IF @CountTabGroup3 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group3,'STORE_'+@NpcCodeName+'_G3_TAB4','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB4')
END
END
IF @CountGroups >= 4
BEGIN
IF @CountTabGroup4 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group4,'STORE_'+@NpcCodeName+'_G4_TAB1','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB1')
END
IF @CountTabGroup4 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group4,'STORE_'+@NpcCodeName+'_G4_TAB2','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB2')
END
IF @CountTabGroup4 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group4,'STORE_'+@NpcCodeName+'_G4_TAB3','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB3')
END
IF @CountTabGroup4 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group4,'STORE_'+@NpcCodeName+'_G4_TAB4','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB4')
END
END
SET IDENTITY_INSERT [dbo].[_RefShopTab] OFF
END ELSE BEGIN
IF @CountGroups >= 1
BEGIN
IF @CountTabGroup1 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group1,'STORE_'+@NpcCodeName+'_TAB1','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB1')
END
IF @CountTabGroup1 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group1,'STORE_'+@NpcCodeName+'_TAB2','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB2')
END
IF @CountTabGroup1 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group1,'STORE_'+@NpcCodeName+'_TAB3','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB3')
END
IF @CountTabGroup1 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group1,'STORE_'+@NpcCodeName+'_TAB4','STORE_'+@NpcCodeName+'_GROUP1','SN_STORE_'+@NpcCodeName+'_TAB4')
END
END
IF @CountGroups >= 2
BEGIN
IF @CountTabGroup2 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group2,'STORE_'+@NpcCodeName+'_G2_TAB1','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB1')
END
IF @CountTabGroup2 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group2,'STORE_'+@NpcCodeName+'_G2_TAB2','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB2')
END
IF @CountTabGroup2 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group2,'STORE_'+@NpcCodeName+'_G2_TAB3','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB3')
END
IF @CountTabGroup2 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group2,'STORE_'+@NpcCodeName+'_G2_TAB4','STORE_'+@NpcCodeName+'_GROUP2','SN_STORE_'+@NpcCodeName+'_G2_TAB4')
END
END
IF @CountGroups >= 3
BEGIN
IF @CountTabGroup3 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group3,'STORE_'+@NpcCodeName+'_G3_TAB1','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB1')
END
IF @CountTabGroup3 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group3,'STORE_'+@NpcCodeName+'_G3_TAB2','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB2')
END
IF @CountTabGroup3 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group3,'STORE_'+@NpcCodeName+'_G3_TAB3','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB3')
END
IF @CountTabGroup3 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group3,'STORE_'+@NpcCodeName+'_G3_TAB4','STORE_'+@NpcCodeName+'_GROUP3','SN_STORE_'+@NpcCodeName+'_G3_TAB4')
END
END
IF @CountGroups >= 4
BEGIN
IF @CountTabGroup4 >=1
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab1Group4,'STORE_'+@NpcCodeName+'_G4_TAB1','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB1')
END
IF @CountTabGroup4 >=2
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab2Group4,'STORE_'+@NpcCodeName+'_G4_TAB2','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB2')
END
IF @CountTabGroup4 >=3
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab3Group4,'STORE_'+@NpcCodeName+'_G4_TAB3','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB3')
END
IF @CountTabGroup4 >=4
BEGIN
INSERT [dbo].[_RefShopTab] ([Service], [Country], [ID], [CodeName128], [RefTabGroupCodeName], [StrID128_Tab]) VALUES (1, 15, @ShopTab4Group4,'STORE_'+@NpcCodeName+'_G4_TAB4','STORE_'+@NpcCodeName+'_GROUP4','SN_STORE_'+@NpcCodeName+'_G4_TAB4')
END
END
END
END ELSE BEGIN
Print 'This Code already exists'
END

