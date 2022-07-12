function LOAD() {
	global.DATA = ds_map_secure_load("sdt");
	
	global.PlayerLV = GetConditionValue("lv");
	global.PlayerAttack = GetConditionValue("atk");
	global.PlayerDefense = GetConditionValue("def");
	
	global.SoulSpeed = GetConditionValue("spd");
	global.PlayerEXP = GetConditionValue("xp");
	global.PlayerGOL = GetConditionValue("gold");
	global.Name = GetConditionValue("THEIR_NAME");
	
	global.PlayerKills = GetConditionValue("kills");
	
	global.Item[0] = GetConditionValue("item_1");
	global.Item[1] = GetConditionValue("item_2");
	global.Item[2] = GetConditionValue("item_3");
	global.Item[3] = GetConditionValue("item_4");
	global.Item[4] = GetConditionValue("item_5");
	global.Item[5] = GetConditionValue("item_6");
	global.Item[6] = GetConditionValue("item_7");
	global.Item[7] = GetConditionValue("item_8");
	
	global.Cell[0] = GetConditionValue("cell_1");
	global.Cell[1] = GetConditionValue("cell_2");
	global.Cell[2] = GetConditionValue("cell_3");
	global.Cell[3] = GetConditionValue("cell_4");
	
	global.PlayerArmor = GetConditionValue("armor");
	global.PlayerWeapon = GetConditionValue("weapon");
	
	global.PlayerMaxHP = 20 + (4 * (global.PlayerLV - 1));
	global.PlayerHP = global.PlayerMaxHP;
	
	room_goto(GetConditionValue("room"));
}