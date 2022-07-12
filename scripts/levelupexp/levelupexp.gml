// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LevelUpEXP(_exp) {
	if _exp >= 10 global.PlayerLV = 2;
	if _exp >= 30 global.PlayerLV = 3;
	if _exp >= 70 global.PlayerLV = 4;
	if _exp >= 120 global.PlayerLV = 5;
	if _exp >= 200 global.PlayerLV = 6;
	if _exp >= 300 global.PlayerLV = 7;
	if _exp >= 500 global.PlayerLV = 8;
	if _exp >= 800 global.PlayerLV = 9;
	if _exp >= 1200 global.PlayerLV = 10;
	if _exp >= 1700 global.PlayerLV = 11;
	if _exp >= 2500 global.PlayerLV = 12;
	if _exp >= 3500 global.PlayerLV = 13;
	if _exp >= 5000 global.PlayerLV = 14;
	if _exp >= 7000 global.PlayerLV = 15;
	if _exp >= 10000 global.PlayerLV = 16;
	if _exp >= 15000 global.PlayerLV = 17;
	if _exp >= 25000 global.PlayerLV = 18;
	if _exp >= 50000 global.PlayerLV = 19;
	if _exp >= 99999 global.PlayerLV = 20;
	global.PlayerMaxHP = 20 + ((global.PlayerLV - 1) * 4);
	if (global.PlayerLV == 20) {
		global.PlayerMaxHP = 99;
	}
}