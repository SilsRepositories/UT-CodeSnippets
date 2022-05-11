function UseItem(itemNum) {
	var StartingHP = global.PlayerHP;
	var Healed = false;
	var ItemKeep = false;
	var PrevArmor = "";
	var PrevWeapon = "";
	
	var border_l = 320 - (obj_BulletBoard.current_width / 2);
	var border_u = 384 - obj_BulletBoard.current_height;
	
	global.Monster[0].Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
	global.Monster[0].Dialogue.CanAdvance = true;
	
	if (global.Item[itemNum] == "Pie") {
		global.PlayerHP += 99;
		global.Monster[0].Dialogue.TextToDraw = "* You ate the Butterscotch Pie.&";
	}
	
	if (global.Item[itemNum] == "Stick") {
		global.Monster[0].Dialogue.TextToDraw = "* You threw the Stick.&* Then you picked it back up&  again.";
	}
	
	if (global.Item[itemNum] == "Unisicle") {
		global.Monster[0].Dialogue.TextToDraw = "* You ate the Unisicle.&";
		global.PlayerHP += 11;
	}
	if (global.Item[itemNum] == "Bisicle") {
		global.Monster[0].Dialogue.TextToDraw = "* You eat one half of the&  Bisicle.&";
		global.Item[itemNum] = "Unisicle";
		global.PlayerHP += 11;
		ItemKeep = true;
	}
	
	if (global.Item[itemNum] == "S.Apron") {
		global.Monster[0].Dialogue.TextToDraw = "* You donned the Stained Apron.";
		PrevArmor = global.PlayerArmor;
		global.PlayerArmor = global.Item[itemNum];
	}
	
	if (global.Item[itemNum] == "Bandage") {
		global.Monster[0].Dialogue.TextToDraw = "* You reapplied the Bandage.&* Still kind of gooey.&";
		global.PlayerHP += 10;
	}
	
	if (global.Item[itemNum] == "L.Hero") {
		global.PlayerHP += 40;
		global.PlayerAttack += 4;
		global.Monster[0].Dialogue.TextToDraw = "* You ate the Legendary Hero.&* ATTACK increased by 4!&";
	}
	
	if (PrevArmor != "")
		global.Item[itemNum] = PrevArmor;
	if (PrevWeapon != "")
		global.Item[itemNum] = PrevWeapon;
	if (StartingHP < global.PlayerHP) {
		audio_play_sound(Heal, 1, false);
		if !ItemKeep {
			global.Item[itemNum] = "";
			Healed = true;
		}
		if (global.PlayerHP >= global.PlayerMaxHP) {
			global.Monster[0].Dialogue.TextToDraw += "* Your HP was maxed out!";
		}
		else {
			global.Monster[0].Dialogue.TextToDraw += "* You recovered " + string(global.PlayerHP - StartingHP) + " HP!";
		}
	}
	else {
		audio_play_sound(Item, 1, false);
	}
	global.PlayerHP = clamp(global.PlayerHP, 0, global.PlayerMaxHP);
	for (var i = 0; i < array_length(global.Item) - 1; i++) {
		if (global.Item[i] == "") {
			global.Item[i] = global.Item[i + 1];
			global.Item[i + 1] = "";
		}
	}
	if Healed
		array_resize(global.Item, array_length(global.Item) - 1);
}
