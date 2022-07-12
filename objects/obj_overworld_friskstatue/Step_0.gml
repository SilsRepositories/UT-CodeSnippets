depth = -y;
if IBox == noone {
	IBox = instance_create_depth(x, y, depth + 1, obj_Interaction);
	IBox.TextToDraw = "* What do you believe the purpose&  of this is?";
	IBox.TextQueue[0] = "* I have no idea, I'm just a&  placeholder.";
}
else {
	IBox.x = x;
	IBox.y = y;
	IBox._Host = id;
}