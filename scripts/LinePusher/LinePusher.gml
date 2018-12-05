/// @description  LinePusher();

// Push lines in internal grid
var highest = ds_grid_height(global.playfield);
for (; highest >= 0; highest--) {
    if ds_grid_get_max(global.playfield, 0, 0, global.width - 1, highest - 1) == -1 break;
    while ds_grid_get_max(global.playfield, 0, highest, global.width - 1, highest) == -1 
        ds_grid_set_grid_region(global.playfield, global.playfield, 0, 0, global.width - 1, highest - 1, 0, 1);
}

instance_destroy(o_square);

// Push lines on external grid
for (var i = highest - 1; i < ds_grid_height(global.playfield); i++) {
    for (var j = 0; j < global.width; j++) {
        var colour = ds_grid_get(global.playfield, j, i);
        if colour != -1 && i >= 20 {
            var square = instance_create_layer(global.border[0] + j * 32, (i - global.height) * 32 + global.border[3], "Instances", o_square);
            square.image_index = colour;
        }
    }
}

part_emitter_destroy_all(global.par_sys);
with o_spawner alarm_set(1, 5);
instance_destroy();
