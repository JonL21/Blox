

/// @func changeShiftDelay()
/// @desc Change the Shift Delay
function changeShiftDelay() {
	var slow = 15, fast = 1;
	switch keyboard_key {
		case vk_left: global.shift_delay = min(slow, global.shift_delay + 1); break;
		case vk_right: global.shift_delay = max(fast, global.shift_delay - 1); break;
	}
	ini_open("settings.ini");
	ini_write_real("Preferences", "Shift_Delay", global.shift_delay);
	ini_close();
}

function checkSD() {
	var slow = 15, fast = 1;
	if global.shift_delay == slow return 0;
	else if global.shift_delay == fast return 1;
	return -1;
}

/// @func changeRepeatRate()
/// @desc Change the Repeat Delay
function changeRepeatRate() {
	var slow = 6, fast = 1;
	switch keyboard_key {
		case vk_left: global.repeat_delay = min(slow, global.repeat_delay + 1); break;
		case vk_right: global.repeat_delay = max(fast, global.repeat_delay - 1); break;
	}
	ini_open("settings.ini");
	ini_write_real("Preferences", "Repeat_Delay", global.repeat_delay);
	ini_close();
}

function checkRR() {
	var slow = 6, fast = 1;
	if global.repeat_delay == slow return 0;
	else if global.repeat_delay == fast return 1;
	return -1;
}

/// @func changeDropFactor()
/// @desc Change the Drop Factor
function changeDropFactor() {
	var slow = 20, fast = 60;
	switch keyboard_key {
		case vk_left: global.drop_factor = max(slow, global.drop_factor - 5); break;
		case vk_right: global.drop_factor = min(fast, global.drop_factor + 5); break;
	}
	ini_open("settings.ini");
	ini_write_real("Preferences", "Drop_Factor", global.drop_factor);
	ini_close();
}

function checkDF() {
	var slow = 20, fast = 60;
	if global.drop_factor == slow return 0;
	else if global.drop_factor == fast return 1;
	return -1;	
}

/// @func changeParticleEffects()
/// @desc Change Particles Toggle
function changeParticleEffects() {
	global.particle_effects = !global.particle_effects;
	ini_open("settings.ini");
	ini_write_real("Preferences", "Particle_Effects", global.particle_effects);
	ini_close();
}

/// @func changeCalloutsDisplay()
/// @desc Change Callout Display
function changeCalloutsDisplay() {
	switch keyboard_key {
		case vk_left:
			switch global.show_callouts {
				case callouts.some: global.show_callouts = callouts.none; break;
				case callouts.every: global.show_callouts = callouts.some; break;
			}
			break;
		case vk_right: 
			switch global.show_callouts {
				case callouts.none: global.show_callouts = callouts.some; break;
				case callouts.some: global.show_callouts = callouts.every; break;
			}
			break;
	}
	ini_open("settings.ini");
	ini_write_real("Preferences", "Show_Callouts", global.show_callouts);
	ini_close();
}