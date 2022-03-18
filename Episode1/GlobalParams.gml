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

instance_create_depth(320, 384, 1, obj_BulletBoard);

// Starts a 30-frame timer (half a second at 60FPS)
alarm[0] = 30;
