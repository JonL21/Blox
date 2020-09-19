/// @func GlobalInitializer()
/// @desc Read settings, scores from ini
function GlobalInitializer() {

	//show_debug_overlay(true);

	// Declare globals
	
	// Board Settings [MUST ALL BE EVEN!]
	global.width = 10;
	global.height = 20;
	global.tilesize = 32;
	
	// Technicals
	global.lock_delay = 30; // The amount of frames before block locks down
	global.lock_cancels = 15; // The amount of movements/rotations allowed to cancel lockdown
	global.clear_delay = 8; // The amount of frames it takes to clear lines
	global.to_next_level = 10; // The amount of lines to clear to advance a level
	global.next_blocks = 6; // The amount of next blocks to show
	
	global.endless = false;
	
	global.show_options = false;
	global.show_control_options = false;
	
	// Read from settings file
	ini_open("settings.ini");
	
	// Preferences
	global.shift_delay = ini_read_real("Preferences", "Shift_Delay", DEFAULT_SHIFT_DELAY); // The amount of frames to activate auto repeat movement
	global.repeat_delay = ini_read_real("Preferences", "Repeat_Delay", DEFAULT_REPEAT_DELAY); // The amount of frames between auto repeat shifts
	global.drop_factor = ini_read_real("Preferences", "Drop_Delay", DEFAULT_DROP_FACTOR); // The factor at which soft drop moves block one row down, in terms of current gravity
	global.particle_effects = ini_read_real("Preferences", "Particle_Effects", DEFAULT_SHOW_PARTICLES); // Whether to show particle effects
	global.show_callouts = ini_read_real("Preferences", "Show_Callouts", DEFAULT_SHOW_CALLOUTS); // Which callouts to show
	
	// Controls
	global.C_left = ini_read_string("Controls", "Left", DEFAULT_LEFT);
	global.C_right = ini_read_string("Controls", "Right", DEFAULT_RIGHT);
	global.C_soft_drop = ini_read_string("Controls", "Soft_Drop", DEFAULT_SOFT_DROP);
	global.C_hard_drop = ini_read_string("Controls", "Hard_Drop", DEFAULT_HARD_DROP);
	global.C_hold = ini_read_string("Controls", "Hold", DEFAULT_HOLD);
	global.C_rotate_left = ini_read_string("Controls", "CCW", DEFAULT_ROTATE_LEFT);
	global.C_rotate_right = ini_read_string("Controls", "CW", DEFAULT_ROTATE_RIGHT);
	
	// Leaderboards
	var temp = array_create(10, 0);
	for (var i = 0; i < 10; i++) {
		temp[i] = ini_read_string("Marathon", i, "MAR - 0");
	}
	global.top_scores[0] = temp;
	var temp = array_create(10, 0);
	for (var i = 0; i < 10; i++) {
		temp[i] = ini_read_string("Ultra", i, "ULT - 0");
	}
	global.top_scores[1] = temp;
	var temp = array_create(10, 0);
	for (var i = 0; i < 10; i++) {
		temp[i] = ini_read_string("Sprint", i, "SPR - 0");
	}
	global.top_scores[2] = temp;
	
	// Close file
	ini_close();
	
	// Initialize particle system
	global.par_sys = part_system_create();
	part_system_depth(global.par_sys, -1);

	// Particles
	global.p_spark = part_type_create();
	part_type_sprite(global.p_spark, spr_sparkle, false, false, false);
	part_type_size(global.p_spark, 0.2, 0.4, -0.001, 0);
	part_type_direction(global.p_spark, 90, 90, 0, 0);
	part_type_alpha2(global.p_spark, 0.5, 0);
	part_type_orientation(global.p_spark, 0, 360, 15, 0, false);
	part_type_blend(global.p_spark, true);
	part_type_life(global.p_spark, 25, 25);
	part_type_speed(global.p_spark, 20, 30, -.85, 0.05);

	global.p_hard_drop = part_type_create();
	part_type_sprite(global.p_hard_drop, spr_hard_drop, false, false, false);
	part_type_life(global.p_hard_drop, 15, 15);
	part_type_alpha2(global.p_hard_drop, 0.5, 0);
	part_type_blend(global.p_hard_drop, true);
	
	global.p_blotch = part_type_create();
	part_type_shape(global.p_blotch, pt_shape_sphere);
	part_type_size(global.p_blotch, 0.3, 0.5, -0.001, 0);
	part_type_life(global.p_blotch, 25, 25);
	part_type_alpha2(global.p_blotch, 0.7, 0);
	part_type_direction(global.p_blotch, 90, 90, 0, 0);
	part_type_speed(global.p_blotch, 8, 16, -0.001, 0);
	part_type_blend(global.p_blotch, true);

	global.p_line = part_type_create();
	part_type_shape(global.p_line, pt_shape_line);
	part_type_scale(global.p_line, global.width * 0.52, 4);
	part_type_life(global.p_line, global.clear_delay, global.clear_delay);
	part_type_blend(global.p_line, true);
	var p_line2 = part_type_create();
	part_type_shape(p_line2, pt_shape_line);
	part_type_scale(p_line2, global.width * 0.52, 4);
	part_type_alpha2(p_line2, 1, 0);
	part_type_direction(p_line2, 270, 180, 0, 0);
	part_type_speed(p_line2, 2, 2, 2, 0);
	part_type_life(p_line2, 40, 40);
	part_type_blend(p_line2, true);
	part_type_death(global.p_line, 1, p_line2);
	
	global.p_line_spark = part_type_create();
	part_type_shape(global.p_line_spark, pt_shape_spark);
	part_type_blend(global.p_line_spark, true);
	
	// Randomize randomness
	randomize();
}
