/// @func Kick(offsetSet1, offsetSet2)
/// @desc Processes kick translations to move block
/// @arg {Array} off1 offset values for first state
/// @arg {Array} off2 offset values for second state
// Test each set of offset values
for (var i = 0; i < 5; i++) {
	var first_state = argument0[i];
	var second_state = argument1[i];
	var offx = (first_state[0] - second_state[0]) * 32;
	var offy = (first_state[1] - second_state[1]) * -32;
	// If kick possible, move block and return true
	if !CC(offx, offy) {
		x += offx;
		y += offy;
		return true;
	}
}
// Return false when no tests passed
return false;