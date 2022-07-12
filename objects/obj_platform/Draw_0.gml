depth = 1;
if Inside {
	surface_set_target(global.BORDER_SURFACE);
	draw_self();
	surface_reset_target();
}
else {
	draw_self();
}