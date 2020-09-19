/// @description  Draw held block, next blocks, score

surface_set_target(board_surf);

// Draw background tile layer
draw_tilemap(bg_map, tilemap_get_x(bg_map), tilemap_get_y(bg_map));

// Draw playfield tile layer
if !instance_exists(o_pause)
	draw_tilemap(playfield_map, tilemap_get_x(playfield_map), tilemap_get_y(playfield_map));

// Top Off Line
//draw_rectangle_color(border[0], border[3], border[1] - 1, border[3] + 1, c_red, c_red, c_red, c_red, false);

draw_set_halign(fa_right);
draw_set_font(statFont);
// Draw mode name
var m = "";
switch global.game_mode {
	case mode.marathon:
		if global.endless m = "ENDLESS MARATHON";
		else m = "MARATHON";
		break;
	case mode.ultra: m = "ULTRA"; break;
	case mode.sprint: m = "SPRINT"; break;
	case mode.zen: m = "ZEN"; break;
	case mode.master: m = "MASTER"; break;
}
draw_text_transformed(border[1] + 24, border[2] - 2, m, 1,1, 270);

draw_set_halign(fa_right);
draw_set_font(statFont);
// Draw Score
var _y = score_base_pos[1];
var str = string("Score: " + string(points));
draw_text(score_base_pos[0], _y, str);
_y -= string_height(str);

// Draw Timer
str = "Time: " + FormatTime(timer);
draw_text(score_base_pos[0], _y, str);
_y -= string_height(str);

// Draw Level/Lines Cleared
if global.game_mode != mode.sprint {
	if global.game_mode != mode.zen {
		str = string("Level: " + string(level))
		draw_text(score_base_pos[0], _y, str);
		_y -= string_height(str);
	}
	draw_text(score_base_pos[0], _y, "Lines: " + string(stats[? "Total Lines Cleared"]));
	_y -= string_height("ABC");
}
else {
	draw_text(score_base_pos[0], _y, string("Lines: " + string(max((40 - stats[? "Total Lines Cleared"]), 0))));
	_y -= string_height("ABC");
}

//draw_text(score_base_pos[0], _y, "To next level: " + string(next_level))

// Draw Held Block
draw_set_font(scoreFont);
draw_set_halign(fa_center);
draw_text(border[0] - 64, border[3], "HOLD");

var scale = 0.7;
if !instance_exists(o_pause) {
	var h_y = sprite_get_height(spr_O) * scale + 35;
	switch held_block { case blox.O: h_y -= 16 * scale; }

	if held_block != -1 {
	    if hold_available 
			draw_sprite_ext(held_block, 0, border[0] - 64, border[3] + h_y, scale, scale, 0, c_white, 1);
		else 
			draw_sprite_ext(held_block, 0, border[0] - 64, border[3] + h_y, scale, scale, 0, c_gray, 1);
	}
}
draw_line_width_color(
	border[0] - 24 - string_width("HOLD"), border[3] + 64 + sprite_get_height(spr_O) * scale,
	border[0] - 16, border[3] + 64 + sprite_get_height(spr_O) * scale, 2, c_white, c_white
);

// Draw Stats
if instance_exists(o_pause) {
	_y = border[3] + 78 + sprite_get_height(spr_O) * scale;
	draw_set_halign(fa_right);
	draw_set_font(scoreFont);
	draw_text_shadow(score_base_pos[0], _y, "Statistics", c_black);
	_y += string_height("Statistics");
	draw_set_font(smallFont);
	for (var i = 0; i < array_length_1d(strstats); i++) {
		var str = strstats[i] + ": " + string(stats[? strstats[i]]);
		draw_text_shadow(score_base_pos[0], _y, str, c_black);
		_y += string_height(str);
	}
}

// Draw Next Blocks
draw_set_font(scoreFont);
draw_set_halign(fa_center);
draw_text(border[1] + 64, border[3], "NEXT");
if !instance_exists(o_pause) && !instance_exists(o_game_countdown) {
	var h_y = sprite_get_height(spr_O) * scale + 35;
	var posx = border[1] + 64;
	var posy = border[3] + h_y;
	for (var i = 0; i < global.next_blocks; i++) {
	    var block = bag[| i];
		if is_undefined(block) break;
		var s = scale;
		if i != 0 s -= 0.2;
		if block != blox.O
			draw_sprite_ext(block, 0, posx, posy, s, s, 0, c_white, 1);
		else 
			draw_sprite_ext(block, 0, posx, posy - 16 * s, s, s, 0, c_white, 1);
	    posy += 32 * 3 * s;
	}
}
draw_line_width_color(
	border[1] + 24 + string_width("HOLD"), border[3] + 64 + sprite_get_height(spr_O) * scale,
	border[1] + 16, border[3] + 64 + sprite_get_height(spr_O) * scale, 2, c_white, c_white
);

// Draw Block
if b != noone {
	with b {
		draw_self();
		//draw_sprite_clip(sprite_index, image_index, x, y, 
		//	board_id.border[0], board_id.border[3] - global.tilesize / 4, 
		//	global.width * global.tilesize, global.height * global.tilesize);

		if lockdown_alpha < 1 {
			shader_set(shd_lockdown);
			draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, lockdown_colour, lockdown_alpha);
			shader_reset();
		}
		
		with ghost_block_id draw_self();
	}
}

// Draw Callouts
with o_callout {
	if board_id == other.id {
		draw_set_font(font);
		draw_set_halign(fa_right);

		// Debug
		//draw_text(x - string_width(callout) - 10, y, string(alarm[fadeType]));
		//draw_line(x - string_width(callout), y, x - string_width(callout), y + sprite_height);
		//draw_line_colour(x - string_width(callout) - 10, y, x - string_width(callout)- 10, y + string_height(callout), c_blue, c_blue);
		//draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);

		draw_text_ext_transformed_colour(x, y, callout, 30, 500, size, size, 0, textColour, textColour, textColour, textColour, fade);	
	}
}

surface_reset_target();

// Draw surface
draw_surface(board_surf, offx, offy);