/// @func LinePusher()
/// @desc Push lines down after lines are cleared

// Push lines in internal/visual grid
var highest = ds_grid_height(global.playfield);
for (; highest >= 0; highest--) {
    if ds_grid_get_max(global.playfield, 0, 0, global.width - 1, highest - 1) == -1 break;
    while ds_grid_get_max(global.playfield, 0, highest, global.width - 1, highest) == -1 {
        ds_grid_set_grid_region(global.playfield, global.playfield, 0, 0, global.width - 1, highest - 1, 0, 1);
		var _y = (highest - global.height) * 32 + global.border[3];
		with o_square if y < _y y += 32;
	}
}