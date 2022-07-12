global.BorderWidth = 570;
global.BorderHeight = 120;

global.SoulSpeed = 2;
global.PlayerHP = 20;
global.PlayerMaxHP = 20;
global.PlayerEXP = 0;
global.PlayerGOL = 0;
global.PlayerLV = 1;
global.Name = "";

global.ENTRY_POINT = -1;

global.PlayerAttack = 0;
global.PlayerDefense = 0;
global.InvFrames = 0;
global.Karma = 0;
global.KARMA_ENABLED = true;
global.PlayerKills = 0;

global.UISelectionMenu = 0;
global.BattleMenu = -1;

global.SoulX = 0;
global.SoulY = 0;

global.BattleMusic = MUSIC_Battle;
global.OverworldMusic = 0;
global.CurrentRoom = 0;
global.EnemyGroup = 0;

global.Monster[0] = noone;
global.Monster[1] = noone;
global.Monster[2] = noone;

global.DATA = ds_map_create();

global.Item[0] = "Bandage";

global.Cell[0] = "Toriel's Phone";
global.Cell[1] = "";
global.Cell[2] = "";
global.Cell[3] = "";

global.PlayerArmor = "Bandage";
global.PlayerWeapon = "Stick";

global.CanFlee = true;

START_GameSetup();
room_goto(Room_Name);