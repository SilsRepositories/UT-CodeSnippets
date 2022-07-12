ShowExclamation = true;
SoulX = x;
SoulY = y - 13;
room_persistent = true;
global.CurrentRoom = room;
audio_pause_sound(global.OverworldMusic);
audio_sound_gain(global.OverworldMusic, 0, 0);