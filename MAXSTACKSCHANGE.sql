USE SRO_VT_SHARD 
UPDATE _RefObjItem SET MaxStack = 1000 where ID = (SELECT Link from _RefObjCommon where CodeName128 = '%ITEM_ETC_HP_POTION_02_BASIC%')