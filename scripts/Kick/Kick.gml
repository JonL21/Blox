/// @description Kick
/// @param off1 offset values for first state
/// @param off2 offset values for second state
for (var i = 0; i < 5; i++) {
	var first_state = argument0[i];
	var second_state = argument1[i];
	var offx = (first_state[0] - second_state[0]) * 32;
	var offy = (first_state[1] - second_state[1]) * -32;
	if !CC(offx, offy) {
		x += offx;
		y += offy;
		return true;
	}
}
return false;