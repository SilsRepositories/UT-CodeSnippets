// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetEnemyStatus() {
	if (global.EnemyGroup == 1) {
		choices[0] = "* Aaron stops you."
		choices[1] = "* Aaron flexes his muscles."
		return choices[choose(0, 1)];
	}
	if (global.EnemyGroup == 2) {
		choices[0] = "* Double the flex?"
		choices[1] = "* Double the power?"
		return choices[choose(0, 1)];
	}
	return "* But nobody came.";
}