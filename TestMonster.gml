// CREATE EVENT
MyName = "Sans";
MyHP = 667;
MyMaxHP = 667;
CheckDescription[0] = "* Sans - 10 ATK 67 DEF&* He looks prepared for anything,&  but isn't taking it seriously?";
CheckDescription[1] = "* Maybe it's just a trick.&* Let's just get it over with.";
Act[0] = "Check";
Act[1] = "Taunt";
ShowHealthBar = true;
CanSpare = false;

Attack = 4;
Defense = 0;
Dialogue = noone;
ReadyForBattle = false;

Taunted = false;

// USER EVENT 0
var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_r = 320 + (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;
var border_d = 384;

Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
Dialogue.TextToDraw = CheckDescription[0];
Dialogue.TextQueue[0] = CheckDescription[1];
Dialogue.CanAdvance = true;

// USER EVENT 1
var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_r = 320 + (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;
var border_d = 384;

if !Taunted {
	Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	Dialogue.TextToDraw = "* You tell Sans that his brother&  died for nothing.";
	Dialogue.TextQueue[0] = "* Sans loathes your eagerness to&  destroy him.";
	Dialogue.TextQueue[1] = "* Sans's ATTACK increased!";
	Attack += 2;
	Dialogue.CanAdvance = true;
	Taunted = true;
}
else {
	Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	Dialogue.TextToDraw = "* You say something disturbing, but&  he ignores you.";
	Dialogue.CanAdvance = true;
}

// STEP EVENT
if instance_exists(Dialogue) {
	ReadyForBattle = true;
}
else {
	if ReadyForBattle {
		ReadyForBattle = false;
		alarm[0] = 1;
	}
}

// ALARM 0
global.BorderHeight = 120;
global.BorderWidth = 120;
obj_Soul.x = 320;
obj_Soul.y = 384 - (global.BorderHeight / 2);
obj_Soul.visible = true;
instance_create_depth(x, y, 0, obj_BulletGenerator);
