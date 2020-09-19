/// @description Draw Blox

// Apply Rainbow
if all_clear {
	surface_set_target(surf2);
	shader_set(shd_rainbow);

	shader_set_uniform_f(_uniSpeed, _speed);
	//shader_set_uniform_f(_uniTime, _time);
	shader_set_uniform_f(_uniSaturation, _saturation);
	shader_set_uniform_f(_uniBrightness, _brightness);
	shader_set_uniform_f(_uniSection, _section);
	shader_set_uniform_f(_uniMix, _mix);

	var uv;
	with o_blox {
		uv = sprite_get_uvs(sprite_index, image_index);
		shader_set_uniform_f(other._uniUV, uv[0], uv[2]);
		shader_set_uniform_f(other._uniTime, rainbow_timer);
		draw_self();
	}

	shader_reset();

	surface_reset_target();
}

// Apply Blur
surface_set_target(surf);
shader_set(shd_blur);

shader_set_uniform_f(usize, room_width, room_height, 1); 

with o_blox draw_self();
	
shader_reset();
surface_reset_target();

// Draw surfaces
if !all_clear draw_surface(surf, 0, 0);
else draw_surface(surf2, 0, 0);

// Darken background
draw_set_alpha(board_id != -1 ? 0.35 : 0.55);
draw_rectangle_colour(0, 0, room_width, room_height, c_dkgray,c_dkgray,c_dkgray,c_dkgray, false);
draw_set_alpha(1);