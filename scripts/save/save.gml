// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SAVE() {
	ConditionChange("lv", global.PlayerLV);
	ConditionChange("atk", global.PlayerAttack);
	ConditionChange("def", global.PlayerDefense);
	
	ConditionChange("spd", global.SoulSpeed);
	ConditionChange("xp", global.PlayerEXP);
	ConditionChange("gold", global.PlayerGOL);
	ConditionChange("THEIR_NAME", global.Name);
	
	ConditionChange("kills", global.PlayerKills);
	
	for (var i = 0; i < array_length(global.Item); i++) {
		ConditionChange("item_" + string(i + 1), global.Item[i]);
	}
	
	for (var j = 0; j < array_length(global.Cell); j++) {
		ConditionChange("cell_" + string(j + 1), global.Cell[j]);
	}
	
	ConditionChange("armor", global.PlayerArmor);
	ConditionChange("weapon", global.PlayerWeapon);
	ConditionChange("room", room);
	
	global.PlayerHP = global.PlayerMaxHP;

	ds_map_secure_save(global.DATA, "sdt");
}