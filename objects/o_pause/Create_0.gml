/// @description Menu
// You can write your code in this editor

menu_select = 0;
scales = 0.5;
for (var i = 0; i < 3; i++) {
    scales[i] = 0.5;
}

if (global.game_over) {
    menu_select = 1;
    scales[1] = 1;
}
else {
    menu_select = 0;
    scales[0] = 1;
}

instance_deactivate_object(o_spawner);
instance_deactivate_object(o_falling_block);
instance_deactivate_object(o_ghost_block);