USE SRO_VT_SHARD
BEGIN
UPDATE dbo._RefScrapOfPackageItem
SET MagParamNum = 4,
MagParam1 =30064771150,
MagParam2 =30064771144,
MagParam3 =858993459290,
MagParam4 =257698037862
WHERE RefItemCodeName LIKE 'ITEM_%_%_09_A_RARE'
END
BEGIN
USE SRO_VT_SHARD
UPDATE dbo._RefScrapOfPackageItem
SET MagParamNum = 6,
MagParam1 =30064771144,
MagParam2 =30064771150,
MagParam3 =85899346100,
MagParam4 =85899346094,
MagParam5 =85899346112,
MagParam6 =85899346106
WHERE RefItemCodeName LIKE 'ITEM_%_%RING_09_A_RARE'
END
BEGIN
USE SRO_VT_SHARD
UPDATE dbo._RefScrapOfPackageItem
SET MagParamNum = 3,
MagParam1 =30064771150,
MagParam2 =30064771144,
MagParam3 =858993459290
WHERE RefItemCodeName LIKE 'ITEM_%_SHIELD_09_A_RARE'
END
BEGIN
USE SRO_VT_SHARD
UPDATE dbo._RefScrapOfPackageItem
SET MagParamNum = 6,
MagParam1 =30064771144,
MagParam2 =30064771150,
MagParam3 =85899346100,
MagParam4 =85899346094,
MagParam5 =85899346112,
MagParam6 =85899346106
WHERE RefItemCodeName LIKE 'ITEM_%_NECKLACE_09_A_RARE'
END