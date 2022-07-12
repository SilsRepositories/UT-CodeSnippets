if (MyHP > 0) {
	global.BorderHeight = 120;
	global.BorderWidth = 180;
	obj_Soul.x = 320;
	obj_Soul.y = 384 - (global.BorderHeight / 2);
	obj_Soul.visible = true;
	instance_destroy(obj_TargetField);
	instance_destroy(obj_TargetBar);
	
	Turn += 1;
	
	MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
	if (Turn == 1) {
		MySpeechBubble.TextToSend = "HEY HUMAN!";
		MySpeechBubble.TextToStore[0] = "IT IS I, THE&GREAT PAPYRUS!";
		MySpeechBubble.Talker = "Papyrus";
	}
	if (Turn == 2) {
		MySpeechBubble.TextToSend = "hehehehehe";
		MySpeechBubble.TextToStore[0] = "heya.";
		MySpeechBubble.TextToStore[1] = "you've been busy&huh?";
		MySpeechBubble.Talker = "SansA";
	}
	if (Turn == 3) {
		MySpeechBubble.TextToSend = "ENTRY NUMBER 17";
		MySpeechBubble.TextToStore[0] = "DARK";
		MySpeechBubble.TextToStore[1] = "DARKER";
		MySpeechBubble.TextToStore[2] = "YET DARKER";
		MySpeechBubble.Talker = "Gaster";
	}
	if (Turn > 3) {
		MySpeechBubble.TextToSend = "Now I'm normal.";
	}
	
	// DON'T TOUCH, this is for when the speech bubble appears, it delays the attack until it is gone
	alarm[4] = 3;
}
else {
	alarm[2] = 1;
	instance_destroy(obj_TargetField);
	instance_destroy(obj_TargetBar);
}
