global.BorderWidth = 570;
global.BorderHeight = 120;

global.PlayerAttack = 20;
global.PlayerDefense = 11;
global.InvFrames = 0;

global.PlayerMaxHP = 20 + ((global.PlayerLV - 1) * 4);
if (global.PlayerLV == 20) {
	global.PlayerMaxHP = 99;
}

global.UISelectionMenu = 0;
global.BattleMenu = -1;

CreateEnemyGroup(global.EnemyGroup);
instance_create_depth(320, 384, 1, obj_BulletBoard);
obj_Soul.visible = false;