// BlockEnder

/* 
    Process when the falling block is locked into position.
*/

with o_ghost_block instance_destroy();

// Calculate position of squares of block
var posx;
var posy;
var repeats;
if sprite_index == spr_I { 
    posx = x - 64;
    posy = y - 64;
    repeats = 4;
}
else if sprite_index == spr_O {
    posx = x - 32;
    posy = y - 32;
    repeats = 2;
}
else {
    posx = x - 48;
    posy = y - 48;
    repeats = 3;
}

var ind = 0;
var checked = false;

// Lock-in particle effect
part_emitter_region(global.par_sys, emitter, x - 16, x + 16, y - 16, y + 16, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.par_sys, emitter, global.p_spark, irandom_range(3, 8));

// Record position of block on internal grid
repeat repeats {
    checked = false;
    repeat repeats {
        if instance_position(posx, posy, o_falling_block) == id {
            if !checked { checked = true; lines[ind] = (posy - global.border[3]) / 32 + global.height; ind++; }
            ds_grid_set(global.playfield, (posx - global.border[0]) / 32, (posy - global.border[3]) / 32 + global.height, id.sprite_index);
            var dsi = instance_create(posx, posy, o_square);
            dsi.image_index = sprite_index;
        }
        posx += 32;
    }
    posx -= 32 * repeats;
    posy += 32;
}
visible = false;

if !global.game_over alarm[2] = 1;
