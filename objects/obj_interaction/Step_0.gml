if instance_exists(Dialogue) {
	PostEvent = true;
}
else {
	if (_Host == obj_SavePoint.id && PostEvent) {
		PostEvent = false;
		instance_create_depth(0, 0, -1000000, obj_SavePointMenu);
		obj_Overworld_Frisk.Frozen = true;
	}
}