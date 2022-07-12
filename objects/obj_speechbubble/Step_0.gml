if MyTextElement == noone {
	MyTextElement = instance_create_depth(x + 35, y - 25, -100000, obj_TextElement);
	MyTextElement.TextToDraw = TextToSend;
	MyTextElement.TextQueue = TextToStore;
	MyTextElement.Talker = Talker;
	MyTextElement.DefaultColour = c_black;
}
else {
	if !instance_exists(MyTextElement) {
		instance_destroy();
	}
}