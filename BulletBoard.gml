// CREATE EVENT: This code should be added into your Create event, otherwise your game will crash
current_width = 0;
current_height = 0;

// Object instances, they are set to "noone" because they're not assigned in Create
Dialogue = noone;
Fight = noone;
Act = noone;
ActML = noone;
ActMR = noone;
ItemL = noone;
ItemR = noone;
Mercy = noone;

// STEP EVENT: This code should be added into your Step event
if (current_width < global.BorderWidth) {
	current_width += ((global.BorderWidth - current_width) / 2);
}
if (current_width > global.BorderWidth) {
	current_width -= ((current_width - global.BorderWidth) / 2);
}
if (current_height < global.BorderHeight) {
	current_height += ((global.BorderHeight - current_height) / 2);
}
if (current_height > global.BorderHeight) {
	current_height -= ((current_height - global.BorderHeight) / 2);
}
  
// DRAW EVENT: This code should be added into your Draw event
var border_l = 320 - (current_width / 2);
var border_r = 320 + (current_width / 2);
var border_u = 384 - current_height;
var border_d = 384;

if (current_width == 570 && current_height == 120) {
	// Set up the text writer
	if instance_exists(Dialogue) {
		Dialogue.visible = false;
		Fight.visible = false;
		Act.visible = false;
		
		ActML.visible = false;
		ActMR.visible = false;
		
		ItemL.visible = false;
		ItemR.visible = false;
		Mercy.visible = false;
	}
	if (global.BattleMenu == -1) {
		// Create the instance responsible for drawing text
		Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
		Dialogue.TextToDraw = "* I'm a ~Btext~D. I have some&  ~Rdeadly~D properties, and ~Ablue&  ~Ohot ~Ghealing~D items. ~YSpare~D me. ~P<3";
		Dialogue.CanAdvance = false;
		
		Fight = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			Fight.TextToDraw = "* " + global.Monster[i].MyName;
		}
		Fight.TextLength = string_length(Fight.TextToDraw);
		Fight.CanAdvance = false;
		Fight.visible = false;
		
		Act = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			Act.TextToDraw = "* " + global.Monster[i].MyName;
		}
		Act.TextLength = string_length(Act.TextToDraw);
		Act.CanAdvance = false;
		Act.visible = false;
		
		ActML = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		ActML.visible = false;
		ActMR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
		ActMR.visible = false;
		
		ItemL = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Item); i += 2) {
			ItemL.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemL.TextLength = string_length(ItemL.TextToDraw);
		ItemL.CanAdvance = false;
		ItemL.visible = false;
		
		ItemR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
		for (var i = 1; i < array_length(global.Item); i += 2) {
			ItemR.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemR.TextLength = string_length(ItemR.TextToDraw);
		ItemR.CanAdvance = false;
		ItemR.visible = false;
		
		Mercy = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			if global.Monster[i].CanSpare {
				Mercy.TextToDraw += "~Y";
				break;
			}
		}
		Mercy.TextToDraw += "* Spare~D&* Flee";
		if !global.CanFlee
			Mercy.TextToDraw += "* Spare";
		Mercy.TextLength = string_length(Mercy.TextToDraw);
		Mercy.CanAdvance = false;
		Mercy.visible = false;
		
		// For long conversations such as in cutscenes, use an array to store your next few lines
		// In this case, I've set it to have 256 total lines if they are all full, but you can use up to 32,000 (Game Maker limitation, yay)
		// EXAMPLE:
		// Dialogue.TextToDraw = "* Hi guys, I'm present.&* Where's my cookie?";
		// Dialogue.TextQueue[0] = "* Sorry, you don't get one.";
		// Dialogue.TextQueue[1] = "* WHAT DO YOU MEAN?";
		// Dialogue.TextQueue[2] = "* I WAS WORKING FOR 60 HOURS&  AND YOU HAVEN'T GIVEN ME ONE!";
		// Dialogue.TextQueue[3] = "* Sorry, mate. But I'm afraid&  you still don't get one...";
		
		// EXAMPLE FROM UNDERTALE REJUVENATION
		// Dialogue.TextToDraw = "* The Great Papyrus&  110 - ATK, 80 - DEF.";
		// Dialogue.TextQueue[0] = "* Can't take damage...&* Maybe try tiring him out!";
		
		// Sets the menu state to enable menu navigation
		// Also gets us out of this loop so that you don't create infinite writers, which would cause a memory leak and crash the game
		global.BattleMenu = 0;
	}
	if (global.BattleMenu == 0)
		Dialogue.visible = true;
	if (global.BattleMenu == 1)
		Fight.visible = true;
	if (global.BattleMenu == 2)
		Act.visible = true;
		
	if (global.BattleMenu == 2.5) {
		ActML.visible = true;
		ActMR.visible = true;
		ActML.TextToDraw = "";
		for (var j = 0; j < array_length(global.Monster[global.MRN].Act); j += 2) {
			ActML.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
		}
		ActML.TextLength = string_length(ActML.TextToDraw);
		ActML.CanAdvance = false;
		
		ActMR.TextToDraw = "";
		for (var j = 1; j < array_length(global.Monster[global.MRN].Act); j += 2) {
			ActMR.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
		}
		ActMR.TextLength = string_length(ActMR.TextToDraw);
		ActMR.CanAdvance = false;
	}
		
	if (global.BattleMenu == 3) {
		ItemL.visible = true;
		ItemR.visible = true;
	}
	if (global.BattleMenu == 4)
		Mercy.visible = true;
}

// Clamps the Soul object inside the Bullet Board
obj_Soul.x = clamp(obj_Soul.x, border_l + 8, border_r - 8);
obj_Soul.y = clamp(obj_Soul.y, border_u + 8, border_d - 8);
    
// Draws the white outline first, and then the inner black space
draw_set_color(c_white);
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

// Draw the HP and LV, as well as initialise variables for the HP bar length
var hp_barwidth = global.PlayerMaxHP;
var hp_barwidth_fill = global.PlayerHP;
draw_set_font(font_battleui_hp);
draw_set_color(c_white);
draw_text(30, 400, global.Name + "    LV " + string(global.PlayerLV));
draw_text(320 + hp_barwidth, 400, string(global.PlayerHP) + " / " + string(global.PlayerMaxHP));

// Draw "HP"
draw_set_font(font_battleui_widgets);
draw_text(255, 400, "HP");

// Draw the health bar
draw_set_color(c_red);
draw_rectangle(300, 400, 300 + hp_barwidth, 418, false);
draw_set_color(c_yellow);
draw_rectangle(300, 400, 300 + hp_barwidth_fill, 418, false);
