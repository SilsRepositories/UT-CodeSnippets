if (!surface_exists(global.BORDER_SURFACE)) {
	global.BORDER_SURFACE = surface_create(640, 480)
}
surface_set_target(global.BORDER_SURFACE);
draw_clear_alpha(c_black, 0);
surface_reset_target();