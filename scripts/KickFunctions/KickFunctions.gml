/// @func Kick(offsetSet1, offsetSet2)
/// @desc Processes kick translations to move block
/// @arg {Array} off1 offset values for first state
/// @arg {Array} off2 offset values for second state
function Kick(argument0, argument1) {
	// Test each set of offset values
	for (var i = 0; i < 5; i++) {
		var first_state = argument0[i];
		var second_state = argument1[i];
		var offx = (first_state[0] - second_state[0]) * global.tilesize;
		var offy = (first_state[1] - second_state[1]) * -global.tilesize;
		// If kick possible, move block and return true
		if !CC(offx, offy) {
			x += offx;
			y += offy;
			return true;
		}
	}
	return false;
}

/// @func KickI(offsetSet, isCCW)
/// @desc Processes kick translations to move I block
/// @arg {Array} off1 offset values for first state
/// @arg {Boolean} CCW? If this rotation is counterclockwise
function KickI(argument0, argument1) {
	// Test each set of offset values
	for (var i = 0; i < 5; i++) {
		var translations = argument0[i];
		var offx = translations[0] * global.tilesize;
		var offy = translations[1] * -global.tilesize;
		if argument1 { // Negate values if CCW
			offx *= -1;
			offy *= -1;
		}
		// If kick possible, move I block and return true
		if !CC(offx, offy) {
			x += offx;
			y += offy;
			return true;
		}
	}
	return false;
}