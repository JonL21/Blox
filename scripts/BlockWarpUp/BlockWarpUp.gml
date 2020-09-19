/// @func BlockWarpUp()
/// @desc Update Score, Stats; Callouts
function BlockWarpUp() {
	ScoreAdder();
	UpdateStats();
	part_emitter_destroy_all(global.par_sys); // Destroy all particle emitters
	board_id.hold_available = true; // Reset Hold Available flag
	instance_destroy();	// Destroy block
}

/// @func ScoreAdder()
/// @desc Calculates the points earned after placing block
function ScoreAdder() {
	var sum = 0;
	var output = ""; // Constructing output for callout
	switch tspin_type {
		case tspin_check.tspin:
			output += "T-Spin ";
			break;
		case tspin_check.mini:
			output += "T-Spin Mini ";
			sum += 100;
			break;
	}
	switch cleared_lines {
	    case 0:
	        if tspin_type == tspin_check.tspin sum += 400;
			board_id.combo = -1;
	        break;
	    case 1:
	        if tspin_type == tspin_check.tspin sum += 800;
	        else sum += 100;
			output += "Single"; break;	
	        break;
	    case 2:
	        if tspin_type == tspin_check.tspin sum += 1200;
			else sum += 300;
			output += "Double"; break;	
	        break;
	    case 3:
	        if tspin_type == tspin_check.tspin sum += 1600;
			else sum += 500;
			output += "Triple"; break;	
	        break;
	    case 4: 
			sum += 800;
			output += "Quadruple"; break;	
			break;
	}

	// BACK TO BACK Bonus
	if board_id.b2b && (tspin_type != tspin_check.none || cleared_lines == 4) {
	    sum += sum + (sum * 0.5);
		output = "BACK TO BACK\n" + output;
	}
	// Setting B2B indicator
	else if tspin_type != tspin_check.none || cleared_lines == 4 board_id.b2b = true;
	else if cleared_lines > 0 board_id.b2b = false;

	// PERFECT CLEAR Bonus
	if all_clear {
		switch cleared_lines {
			case 1: sum += 800; break;
			case 2: sum += 1000; break;
			case 3: sum += 1800; break;
			case 4: sum += 2000; break;
		}
		output = "ALL CLEAR";
		with o_blox_rain {
			all_clear = true;
			_mix = 0.5
			alarm[1] = 2 * game_get_speed(gamespeed_fps);
		}
	}

	CalloutSpawner(output);

	// Combo Bonus
	sum += clamp(board_id.combo * 50, 0, 2100);

	// Hard Drop Bonus
	sum += drop_points;

	// Level Multiplier
	sum *= board_id.level;
	
	board_id.points += sum;
}

/// @func UpdateStats()
/// @desc Update statistics where applicable
function UpdateStats() {

	switch cleared_lines {
		case 0:
			if tspin_type == tspin_check.mini board_id.stats[? "T-Spin Minis"]++;
			else if tspin_type == tspin_check.tspin board_id.stats[? "T-Spins"]++;
			break;
		case 1:
			if tspin_type == tspin_check.mini board_id.stats[? "T-Spin Mini Singles"]++;
			else if tspin_type == tspin_check.tspin board_id.stats[? "T-Spin Singles"]++;
			else board_id.stats[? "Singles"]++;
			break;
		case 2:
			if tspin_type == tspin_check.mini board_id.stats[? "T-Spin Mini Doubles"]++;
			else if tspin_type == tspin_check.tspin board_id.stats[? "T-Spin Doubles"]++;
			else board_id.stats[? "Doubles"]++;
			break;
		case 3:
			if tspin_type == tspin_check.tspin board_id.stats[? "T-Spin Triples"]++;
			else board_id.stats[? "Triples"]++;
			break;
		case 4: board_id.stats[? "Quadruples"]++;
			break;
	}

	if board_id.b2b && (tspin_type != tspin_check.none || cleared_lines == 4)
	    board_id.stats[? "Back to Backs"]++;

	if all_clear {
		board_id.stats[? "All Clears"]++;
	}

	board_id.stats[? "Total Lines Cleared"] += cleared_lines;
	board_id.next_level -= cleared_lines;
	if board_id.next_level <= 0 && global.game_mode != mode.zen {
		board_id.level++;
		if board_id.next_level == 0
			board_id.next_level = global.to_next_level;
		else
			board_id.next_level = global.to_next_level - abs(board_id.next_level);
		with o_callout 
			if type == callout_type.level_up 
				instance_destroy();
		with instance_create_layer(board_id.callouts_base_pos[0], board_id.callouts_base_pos[1] + 300, "Instances", o_callout) {
			board_id = other.board_id;
			size = 0.5;
			fadeDelay = 2;
			maxSize = 1.5;
			textColour = c_orange;
			type = callout_type.level_up;
			callout = "LEVEL UP";
			event_user(0);
			alarm[0] = 1;
		}
		with o_blox alarm[0] = 1;
	}

}