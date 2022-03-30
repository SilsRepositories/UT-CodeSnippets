// CREATE EVENT
global.BorderWidth = 570;
global.BorderHeight = 120;

global.SoulSpeed = 2;
global.PlayerHP = 92;
global.PlayerMaxHP = 92;
global.PlayerEXP = 0;
global.PlayerLV = 19;
global.Name = "Sans";

global.PlayerAttack = 20;
global.PlayerDefense = 0;
global.InvFrames = 0;

// Menu necessities
global.UISelectionMenu = 0;
global.BattleMenu = -1;

// Just one monster for now
global.Monster[0] = instance_create_depth(320, 260, 1, obj_TestMonster);

// Inventory for item menu
global.Item[0] = "Pie";
global.Item[1] = "Stick";
global.Item[2] = "L.Hero";
global.Item[3] = "S.Apron";

global.CanFlee = true;

instance_create_depth(320, 384, 1, obj_BulletBoard);
obj_Soul.visible = false;
