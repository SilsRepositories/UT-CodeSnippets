// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckRoomForEnemies(_Steps) {
	if (StepCount > _Steps) {
		StepCount = 0;
		with obj_Overworld_Frisk {
			event_user(0);
			audio_play_sound(Battle_Alert, 0, false);
			if room == Room_HubB
				global.EnemyGroup = choose(1, 2);
			if room == Room_HubA
				global.EnemyGroup = 2;
			Frozen = true;
		}
	}
}