/// @description Free up memory

// Free surfaces
if surface_exists(board_surf)
	surface_free(board_surf);

// Destroy ds_grid
ds_grid_destroy(playfield);