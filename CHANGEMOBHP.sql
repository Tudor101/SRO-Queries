UPDATE _RefObjChar
SET MaxHP = 1451891045
SELECT * FROM dbo._RefObjChar as objchar
JOIN _RefObjCommon as ref on objchar.ID = ref.Link
WHERE ref.CodeName128 LIKE 'MOB_RM_ROC'