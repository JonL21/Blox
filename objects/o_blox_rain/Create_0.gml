/// @description Local Variables

alarm[0] = 1;
depth = 1000;
board_id = -1;

// Variables for applying the blur shader
surf = -1;

usize = shader_get_uniform(shd_blur, "size");

// Variables for applying the rainbow shader
surf2 = -1;

_uniUV         = shader_get_uniform(shd_rainbow, "u_uv");
_uniTime       = shader_get_uniform(shd_rainbow, "u_time");
_uniSpeed      = shader_get_uniform(shd_rainbow, "u_speed");
_uniSection    = shader_get_uniform(shd_rainbow, "u_section");
_uniSaturation = shader_get_uniform(shd_rainbow, "u_saturation"); 
_uniBrightness = shader_get_uniform(shd_rainbow, "u_brightness");
_uniMix        = shader_get_uniform(shd_rainbow, "u_mix");

_speed = 2.5;
_section = 0.5;
_saturation = 0.7;
_brightness = 0.8;
_mix = 0.0;

all_clear = false;