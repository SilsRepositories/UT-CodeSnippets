if Mode == SoulModes.Green {
	draw_sprite(Soul_Shield_Surround, 0, x, y);
}
if Mode == SoulModes.Purple {
	draw_set_color(c_purple);
	PURPLE_Line1Height = global.BoardFloor - (global.BorderHeight - 10);
	PURPLE_Line2Height = global.BoardFloor - (global.BorderHeight / 2);
	PURPLE_Line3Height = global.BoardFloor - 10;
	
	if PURPLE_SpiderLine == 1 y = PURPLE_Line1Height;
	if PURPLE_SpiderLine == 2 y = PURPLE_Line2Height;
	if PURPLE_SpiderLine == 3 y = PURPLE_Line3Height;
	
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line1Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line1Height);
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line2Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line2Height);
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line3Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line3Height);
}
draw_self();