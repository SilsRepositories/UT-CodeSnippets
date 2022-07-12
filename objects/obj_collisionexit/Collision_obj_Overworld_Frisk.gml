if Fade == noone {
	global.ENTRY_POINT = ExitPoint;
	obj_Overworld_Frisk.Frozen = true;
	Fade = instance_create_depth(0, 0, 0, obj_RoomTransitioner);
	Fade.Destination = Destination;
}