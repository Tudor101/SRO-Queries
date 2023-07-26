USE [SRO_VT_SHARD]
/*哈野浅哈.*/
DECLARE @NPCODE VARCHAR (129)
DECLARE @CHARNAME VARCHAR (64)
DECLARE @Z_X_Y_LOCATION INT
-->
/*West = -32767
South = -16384
Earth = 0
North = +16384*/
SET @NPCODE = 'NPC_MANTICORE_TAILOR' ----- Your Npc Name
SET @CHARNAME = 'wepboi' ----- Charactar name [ where you Want to set npc ]
SET @Z_X_Y_LOCATION = '-26000' -- West
Declare @AS1 int SET @AS1 = (SELECT ID FROM _RefObjCommon WHERE CodeName128 = @NPCODE)
Declare @AS2 int SET @AS2 = (SELECT dwTacticsID FROM Tab_RefTactics WHERE dwObjID = @AS1)
Declare @AS3 int SET @AS3 = (SELECT dwNestID FROM Tab_RefNest WHERE dwTacticsID = @AS2)
Declare @ASpos1 int SET @ASpos1 = (SELECT latestregion FROM _char WHERE charname16 = @CHARNAME)
Declare @ASpos2 int SET @ASpos2 = (SELECT posx FROM _char WHERE charname16 = @CHARNAME)
Declare @ASpos3 int SET @ASpos3 = (SELECT posy FROM _char WHERE charname16 = @CHARNAME)
Declare @ASpos4 int SET @ASpos4 = (SELECT posz FROM _char WHERE charname16 = @CHARNAME)
UPDATE Tab_RefNest
SET nregiondbid = @ASpos1,
flocalposx = @ASpos2,
flocalposy = @ASpos3,
flocalposz = @ASpos4,
wInitialDir = @Z_X_Y_LOCATION
WHERE dwnestid = @AS3 and dwtacticsid = @AS2 