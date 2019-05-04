/// @description  Draw held block, next blocks, score

// Score
draw_set_font(scoreFont);
draw_set_halign(fa_left);
posx = 64;
draw_text(global.border[1] + 128, global.border[3] + posx, string("Score: " + string(score)));
posx += 32;
draw_set_font(deFont);
draw_text(global.border[1] + 128, global.border[3] + posx, string("Total Lines Cleared: " + string(global.total_lines)));
posx += 32;
draw_text(global.border[1] + 128, global.border[3] + posx, string("Singles: " + string(global.singles)));posx += 32;
draw_text(global.border[1] + 128, global.border[3] + posx, string("Doubles: " + string(global.doubles)));posx += 32;
draw_text(global.border[1] + 128, global.border[3] + posx, string("Triples: " + string(global.triples)));posx += 32;
draw_text(global.border[1] + 128, global.border[3] + posx, string("Quadruples: " + string(global.quadruples)));posx += 32;

draw_set_halign(fa_center);

// Held Block
if global.held_block != -1 {
    draw_sprite_ext(global.held_block, 0, x - 32 * 2 - 32 * global.width / 2, 32 * 4, 1, 1, 0, c_white, 1);
}

// Next Blocks
posx = x + 32 * 2 + 32 * global.width / 2;
posy = y + 32 * 4;

for (var i = 0; i < 6; i++) {
    var block = ds_list_find_value(global.bag, i);
    draw_sprite_ext(block, 0, posx, posy, 1, 1, 0, c_white, 1);
    posy += 32 * 3;
}