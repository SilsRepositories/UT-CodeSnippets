function GetConditionValue(value) {
	if ds_map_exists(global.DATA, value)
		return ds_map_find_value(global.DATA, value);
	else
		return 0;
}