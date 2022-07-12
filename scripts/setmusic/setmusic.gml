// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetMusic(room) {
	if (room == Room_HubB && !audio_is_playing(MUSIC_Star)) {
		audio_stop_sound(global.OverworldMusic);
		global.OverworldMusic = MUSIC_Star;
		audio_play_sound(global.OverworldMusic, 20, true);
	}
}