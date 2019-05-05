/// @description KickI
/// @param translations set
/// @param CCW?
for (var i = 0; i < 5; i++) {
	var translations = argument0[i];
	var offx = translations[0] * 32;
	var offy = translations[1] * -32;
	if argument1 {
		offx *= -1;
		offy *= -1;
	}
	//show_debug_message("x: " + string(offx) + ", y: " + string(offy));
	if !CC(offx, offy) {
		x += offx;
		y += offy;
		return true;
	}
}
return false;