// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ConditionChange(condition, outcome) {
	ds_map_replace(global.DATA, condition, outcome);
}