// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreatePlatform(CanCarry, Bounces, MovementSpeed, PositionX, PositionY, Surfaced) {
	var plat = instance_create_depth(PositionX, PositionY, 0, obj_Platform);
	plat.spd = (MovementSpeed / 5);
	plat.bounce = Bounces;
	plat.carry = CanCarry;
	plat.Inside = Surfaced;
}