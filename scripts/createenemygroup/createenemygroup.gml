// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateEnemyGroup(group) {
	global.CanFlee = true;
	global.Monster[0] = noone;
	global.Monster[1] = noone;
	global.Monster[2] = noone;
	global.BattleMusic = audio_play_sound(MUSIC_Battle, 20, true);
	if (group == 1) {
		global.Monster[0] = instance_create_depth(320, 260, 1, obj_TestMonster);
	}
	if (group == 2) {
		global.Monster[0] = instance_create_depth(140, 260, 1, obj_TestMonster);
		global.Monster[1] = instance_create_depth(380, 260, 1, obj_TestMonster);
	}
}