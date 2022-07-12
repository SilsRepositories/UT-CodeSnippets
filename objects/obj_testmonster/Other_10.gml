var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_r = 320 + (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;
var border_d = 384;

Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
Dialogue.TextToDraw = CheckDescription[0];
Dialogue.TextQueue[0] = CheckDescription[1];
Dialogue.CanAdvance = true;
