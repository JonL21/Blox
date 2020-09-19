/// @description Initialize the game
GameInitializer();

br = instance_create_depth(x, y, 1000, o_blox_rain);
br.board_id = id;

board_surf = -1;
offx = 0;
offy = 0;

b = noone;