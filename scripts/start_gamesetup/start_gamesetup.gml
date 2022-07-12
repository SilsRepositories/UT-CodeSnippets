// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function START_GameSetup() {
	// This is so you don't get the same RNG every time you play the game
	// Remove if you want every playthrough to be the same
	randomize();
	
	global.DATA = ds_map_create();
	ConditionChange("lv", 1);
	ConditionChange("atk", 20);
	ConditionChange("def", 20);
	
	ConditionChange("spd", 2);
	ConditionChange("xp", 0);
	ConditionChange("gold", 0);
	ConditionChange("THEIR_NAME", "");
	
	ConditionChange("room", Room_HubA);
	ConditionChange("kills", 0);
	
	ConditionChange("item_1", "");
	ConditionChange("item_2", "");
	ConditionChange("item_3", "");
	ConditionChange("item_4", "");
	ConditionChange("item_5", "");
	ConditionChange("item_6", "");
	ConditionChange("item_7", "");
	ConditionChange("item_8", "");
	
	ConditionChange("cell_0", "");
	ConditionChange("cell_1", "");
	ConditionChange("cell_2", "");
	ConditionChange("cell_3", "");
	
	ConditionChange("armor", "Bandage");
	ConditionChange("weapon", "Stick");
	
	
}