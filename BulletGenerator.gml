// CREATE EVENT
alarm[0] = 30;
alarm[1] = 300;

// DESTROY EVENT
instance_destroy(obj_Bullet);
obj_Soul.visible = false;
global.BattleMenu = -1;
global.UISelectionMenu = obj_ButtonController.BelowUIReferenceNum;
global.BorderWidth = 570;
global.BorderHeight = 120;

// ALARM 0
instance_create_depth(random(640), -40, -1, obj_Bullet);
instance_create_depth(obj_Soul.x, -40, -1, obj_Bullet);
alarm[0] = choose(10, 20, 30);

// ALARM 1
instance_destroy();
