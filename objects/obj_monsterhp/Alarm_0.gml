instance_destroy();
if (global.Damage > 0) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		with (global.Monster[i]) {
			ReadyForBattle = true;
		}
	}
}
