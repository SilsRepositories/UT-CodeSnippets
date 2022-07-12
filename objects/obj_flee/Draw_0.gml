draw_set_color(c_black);
draw_set_alpha(BlackTransparency);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
BlackTransparency += 0.02;
if (BlackTransparency >= 1 && BlackTransparency <= 3) {
	// Go to the Overworld
	BlackTransparency = 4;
	trans = instance_create_depth(x, y, -1000000, obj_RoomTransitioner);
	trans.Destination = global.CurrentRoom;
}
draw_self();
