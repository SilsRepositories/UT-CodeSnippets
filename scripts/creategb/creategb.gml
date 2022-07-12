// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateGB(_x, _y, _angle, _interval, _xscale, _yscale, _aims) {
	var gaster = instance_create_depth(x, y, -10000, obj_GasterBlaster);
	gaster.DestinationX = _x;
	gaster.DestinationY = _y;
	gaster.DestinationAngle = _angle;
	gaster.Interval = _interval;
	if _aims
		gaster.DestinationAngle = point_direction(gaster.DestinationX, gaster.DestinationY, obj_Soul.x, obj_Soul.y) + 90;
	gaster.image_xscale = _xscale;
	gaster.image_yscale = _yscale;
}