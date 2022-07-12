depth = -y;
if IBox == noone {
	IBox = instance_create_depth(x, y, depth + 1, obj_Interaction);
	IBox.TextToDraw = "* You are filled with&  DETERMINATION.";
	IBox.TextQueue[0] = "* HP fully restored.";
}
else {
	IBox.x = x;
	IBox.y = y;
	IBox._Host = id;
}