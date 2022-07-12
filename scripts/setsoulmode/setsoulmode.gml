// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetSoulMode(Colour) {
	if (Colour == "RED") obj_Soul.Mode = 0;
	if (Colour == "BLUE") obj_Soul.Mode = 1;
	if (Colour == "GREEN") obj_Soul.Mode = 2;
	if (Colour == "YELLOW") obj_Soul.Mode = 3;
	if (Colour == "PURPLE") obj_Soul.Mode = 4;
}