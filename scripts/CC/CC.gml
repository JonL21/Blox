// CC

/*
    Returns true if collision or not within borders
*/

// Check for collision
if !place_free(argument0, argument1) return true;
// Check if passes LEFT border
if argument0 < global.border[0] return true;
// Check if passes RIGHT border
else if argument0 > global.border[1] return true;
// Check if passes FLOOR border
if argument1 > global.border[2] return true;
return false;
