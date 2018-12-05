// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // o_initializer
global.__objectDepths[1] = 0; // o_spawner
global.__objectDepths[2] = 0; // o_title
global.__objectDepths[3] = 0; // o_falling_block
global.__objectDepths[4] = 0; // o_ghost_block
global.__objectDepths[5] = 0; // o_square
global.__objectDepths[6] = 0; // o_grid
global.__objectDepths[7] = 0; // o_pline
global.__objectDepths[8] = 0; // o_tester
global.__objectDepths[9] = 0; // o_tester2


global.__objectNames[0] = "o_initializer";
global.__objectNames[1] = "o_spawner";
global.__objectNames[2] = "o_title";
global.__objectNames[3] = "o_falling_block";
global.__objectNames[4] = "o_ghost_block";
global.__objectNames[5] = "o_square";
global.__objectNames[6] = "o_grid";
global.__objectNames[7] = "o_pline";
global.__objectNames[8] = "o_tester";
global.__objectNames[9] = "o_tester2";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for