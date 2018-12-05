/// @description  LineChecker

update = false;

// Particle-related
var separate_emitters = 0;
var emit_regions;

// Check for cleared lines, clear lines on both internal and visual grid
for (var i = 0; i < array_length_1d(lines); i++) {

    // If no empty cells in row
    if ds_grid_get_min(global.playfield, 0, lines[i], global.width - 1, lines[i]) != -1 {
        update = true;
        cleared_lines++;
        
        // Particle related
        emit_regions[separate_emitters] = lines[i];
        separate_emitters++;

        ds_grid_set_region(global.playfield, 0, lines[i], global.width - 1, lines[i], -1); // Clear row

        // Clear row of landed blocks on visual grid
        var x1 = global.border[0], 
            y1 = (lines[i] - global.height) * 32 + global.border[3],
            x2 = global.border[1] - 32,
            y2 = (lines[i] - global.height) * 32 + global.border[3];
        with o_square if point_in_rectangle(x, y, x1, y1, x2, y2) instance_destroy();
    }
    else adjacent = false;
}

if update {
    global.combo++;
    delay = separate_emitters * 0.1;
    part_type_life(global.p_line, 12, 12);
    // Create emitters
    for (var j = 0; j < separate_emitters; j++) {
        var e = part_emitter_create(global.par_sys);
        
        part_emitter_region(global.par_sys, e, 
        (global.border[1] - global.border[0]) / 2 + global.border[0], 
        (global.border[1] - global.border[0]) / 2 + global.border[0], 
        (emit_regions[j] - global.height) * 32 + global.border[3] + 16, 
        (emit_regions[j] - global.height) * 32 + global.border[3] + 16, ps_shape_line, ps_distr_linear);
        part_emitter_burst(global.par_sys, e, global.p_line, 4);
        delay -= 0.1;
    } 

    alarm[3] = 8;
}
else {
    global.combo = -1;
    part_emitter_destroy_all(global.par_sys);
    // Spawn new block
    with o_spawner alarm_set(1, 5);
    instance_destroy();
}
