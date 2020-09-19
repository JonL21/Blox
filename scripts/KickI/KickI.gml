/// @func KickI(offsetSet, isCCW)
/// @desc Processes kick translations to move I block
/// @arg {Array} off1 offset values for first state
/// @arg {Boolean} CCW? If this rotation is counterclockwise
// Test each set of offset values
for (var i = 0; i < 5; i++) {
	var translations = argument0[i];
	var offx = translations[0] * 32;
	var offy = translations[1] * -32;
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
// Return false when no tests passed
return false;