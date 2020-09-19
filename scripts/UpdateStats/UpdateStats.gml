/// @func UpdateStats()
/// @desc Update statistics where applicable

switch cleared_lines {
	case 0:
		if tspin_type == tspin_check.mini
			global.stats[? "T-Spin Minis"]++;
		else if tspin_type == tspin_check.tspin
			global.stats[? "T-Spins"]++;
		break;
	case 1:
		if tspin_type != tspin_check.none
			global.stats[? "T-Spin Singles"]++;
		else
			global.stats[? "Singles"]++;
		break;
	case 2:
		if tspin_type == tspin_check.tspin
			global.stats[? "T-Spin Doubles"]++;
		else
			global.stats[? "Doubles"]++;
		break;
	case 3:
		if tspin_type == tspin_check.tspin
			global.stats[? "T-Spin Triples"]++;
		else
			global.stats[? "Triples"]++;
		break;
	case 4:
		global.stats[? "Quadruples"]++;
		break;
}

if global.b2b && (tspin_type != tspin_check.none || cleared_lines == 4)
    global.stats[? "Back to Backs"]++;

if ds_grid_get_max(global.playfield, 0, 0, global.width - 1, global.height * 2 - 1) == -1
	global.stats[? "All Clears"]++;

global.stats[? "Total Lines Cleared"] += cleared_lines;
if global.stats[? "Total Lines Cleared"] / 10 >= global.level
	global.level++;