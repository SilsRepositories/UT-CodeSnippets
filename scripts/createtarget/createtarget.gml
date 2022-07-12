// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateTarget(weapon) {
	var border_u = 384 - (obj_BulletBoard.current_height - 3);
	instance_create_depth(320, border_u, -1, obj_TargetField);
	var Bars_X = choose(-20, 660);
	
	global.PriorityBar = 0;
	global.BarCount = 0;
	var pr = 0;
	var multibarspeed = 5;
	
	if (global.PlayerAttack == 0) {
		if weapon == "Stick" global.PlayerAttack = 0 + (2 * global.PlayerLV);
		if weapon == "Torn Notebook" global.PlayerAttack = 2 + (2 * global.PlayerLV);
		if weapon == "Toy Knife" global.PlayerAttack = 3 + (2 * global.PlayerLV);
		if weapon == "Tough Glove" global.PlayerAttack = 5 + (2 * global.PlayerLV);
		if weapon == "Ballet Shoes" global.PlayerAttack = 7 + (2 * global.PlayerLV);
		if weapon == "Burnt Pan" global.PlayerAttack = 10 + (2 * global.PlayerLV);
		if weapon == "Empty Gun" global.PlayerAttack = 12 + (2 * global.PlayerLV);
		if weapon == "Worn Dagger" global.PlayerAttack = 15 + (2 * global.PlayerLV);
		if weapon == "Real Knife" global.PlayerAttack = 99 + (2 * global.PlayerLV);
	}
	
	if (weapon == "Stick" || weapon == "Toy Knife" || weapon == "Worn Dagger" || weapon == "Real Knife" || weapon == "Tough Glove") {
		bar = instance_create_depth(Bars_X, 384 - (global.BorderHeight / 2), -2, obj_TargetBar);
		bar.hspeed = ((Bars_X < 320) ? 6 : -6);
		bar.priority = pr;
		global.BarCount = 1;
	}
	
	if (weapon == "Torn Notebook") {
		global.BarCount = 2;
	}
	
	if (weapon == "Ballet Shoes") {
		global.BarCount = 3;
	}
	
	if (weapon == "Burnt Pan") {
		global.BarCount = 4;
	}
	
	if (weapon == "Empty Gun") {
		global.BarCount = 4;
		multibarspeed = 10;
	}
	
	if (global.BarCount > 1) {
		Bars_X = choose(60, 580);
		if multibarspeed > 5 {
			if Bars_X < 320
				Bars_X -= 160;
			else
				Bars_X += 160;
		}
		repeat (global.BarCount) {
			bar = instance_create_depth(Bars_X, 384 - (global.BorderHeight / 2), -2, obj_TargetBar);
			bar.hspeed = ((Bars_X < 320) ? multibarspeed : -multibarspeed);
			bar.priority = pr;
			pr += 1;
			if (Bars_X > 320) {
				Bars_X += choose(20, 60, 100, 180) * (multibarspeed / 5);
			}
			else {
				Bars_X -= choose(20, 60, 100, 180) * (multibarspeed / 5);
			}
		}
	}
}