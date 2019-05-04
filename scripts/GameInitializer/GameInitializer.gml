// GameInitializer

// Define Playfield dimensions (MUST BE EVEN!)
global.width = 10;
global.height = 20;

// Define borders; 0 - Left, 1 - Right, 2 - Floor, 3 - Ceiling
global.border[0] = x - 32 * global.width / 2; 
global.border[1] = x + 32 * global.width / 2;
global.border[2] = y + 32 * (global.height + 2); // Extra two for spawning space
global.border[3] = y + 32 * 2;

// Draw playfield with tiles
posx = global.border[0];
posy = y;
for (var i = 0; i < global.height + 2; i++) {
    for (var j = 0; j < global.width; j++) {
        tile_add(bg_grid, 0, 0, 32, 32, posx, posy, 100);
        posx += 32;
    }
    posy += 32;
    posx = global.border[0];
}

// Spawn invisible wall border
posx = global.border[0] - 32;
posy = y - 32 * 8;
repeat (2) {
    repeat (global.height + 10) {
        instance_create_layer(posx, posy, "Instances", o_grid);
        posy += 32;
    }
    posx = global.border[1];
    posy = y - 32 * 8;
}

posx = global.border[0];
posy = global.border[2];
repeat (global.width) { 
    instance_create_layer(posx, posy, "Instances", o_grid);
    posx += 32;
}

// Initialize internal playfield
global.playfield = ds_grid_create(global.width, global.height * 2);
ds_grid_clear(global.playfield, -1);

// Initialize particle system
global.par_sys = part_system_create();
part_system_depth(global.par_sys, -1);

// Initialize particles
global.p_spark = part_type_create();
part_type_shape(global.p_spark, pt_shape_spark);
part_type_size(global.p_spark, 1, 1.5, -0.005, 0);
part_type_gravity(global.p_spark, 0.25, 90);
part_type_alpha2(global.p_spark, 1, 0);

global.p_line = part_type_create();
part_type_shape(global.p_line, pt_shape_line);
part_type_scale(global.p_line, global.width * 0.6, 4);

p_line2 = part_type_create();
part_type_shape(p_line2, pt_shape_line);
part_type_scale(p_line2, global.width * 0.6, 4); // 10->6
part_type_alpha2(p_line2, 1, 0);
part_type_speed(p_line2, 2, 2, 2, 0);
part_type_life(p_line2, 25, 30);

part_type_death(global.p_line, 1, p_line2);

// Initialize block holder
global.held_block = -1;

// States
global.fall_speed = 1;
global.level = 0;

global.combo = -1;
global.b2b = false;

global.game_over = false;

enum successful_move {
    none = -1,
    left_right = 0,
    soft_drop = 1,
    hard_drop = 2,
    rotation = 3,
    kick = 4
}

enum tspin_check {
	none = -1,
	tspin = 0,
	mini = 1,
}

enum callout_type {
	line = 0,
	combo = 1,
}

// Stats
score = 0;
global.singles = 0;
global.doubles = 0;
global.triples = 0;
global.quadruples = 0;
global.total_lines = 0;

// Intialize block spawner
global.bag = ds_list_create();

// Visuals
scoreFade = 0;

// Generate a bag
alarm_set(0, 1);

// Drop a block
alarm_set(1, 5);