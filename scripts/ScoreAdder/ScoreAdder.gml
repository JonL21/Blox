/// @description  ScoreAdder();

var sum = 0;

switch cleared_lines {
    case 0:
        if tspin_type == tspin_check.tspin sum += 400;
        else if tspin_type == tspin_check.mini sum += 100;
		global.combo = -1;
        break;
    case 1:
        if tspin_type == tspin_check.tspin
			sum += 800;
        else if tspin_type == tspin_check.mini
			sum += 200;
        else
			sum += 100;
        break;
    case 2:
        if tspin_type == tspin_check.tspin
			sum += 1200;
		else
			sum += 300;
        break;
    case 3:
        if tspin_type == tspin_check.tspin
			sum += 1600;
		else
			sum += 500;
        break;
    case 4:
		sum += 800;
        break;
}

UpdateStats();

// Constructing output for callout
var output = "";
switch tspin_type {
	case tspin_check.tspin:
		output += "T-Spin ";
		break;
	case tspin_check.mini:
		output += "T-Spin Mini ";
		break;
}
switch cleared_lines {
	case 1: output += "Single"; break;	
	case 2: output += "Double"; break;	
	case 3: output += "Triple"; break;	
	case 4: output += "Quadruple"; break;	
}

// BACK TO BACK Bonus
if global.b2b && (tspin_type != tspin_check.none || cleared_lines == 4) {
    sum += sum + (sum * 0.5);
	output = "BACK TO BACK\n" + output;
}
// Setting B2B chance indicator
else if tspin_type != tspin_check.none || cleared_lines == 4 global.b2b = true;
else if cleared_lines >= 1 global.b2b = false;

// PERFECT CLEAR Bonus
if ds_grid_get_max(global.playfield, 0, 0, global.width - 1, global.height * 2 - 1) == -1 {
	switch cleared_lines {
		case 1: sum += 800; break;
		case 2: sum += 1000; break;
		case 3: sum += 1800; break;
		case 4: sum += 2000; break;
	}
	output = "ALL CLEAR";
}

var base_x = global.callouts_base_pos[0];
var base_y = global.callouts_base_pos[1];
// Callout Combo
with o_callout {
	if type == callout_type.combo instance_destroy();
}
if global.combo > 0 {
	with instance_create(base_x, base_y, o_callout) {
		type = callout_type.combo;
		callout = "Combo: " + string(global.combo);
		maxSize = 1;
		fadeDelay = 6;
		font = deFont;
		alarm[0] = 1;
	}
	base_y += 32;
	// Make room for combo by pushing line callouts down
	with o_callout {
		if type == callout_type.line {
			if string_count("BACK TO BACK", output) == 1 y += string_height(output);
			y += 32;
		}
	}
}
// Callout Line Clear Type
if string_length(output) > 0 {
	with instance_create(base_x, base_y, o_callout) {
		type = callout_type.line;
		if output == "ALL CLEAR" {
			textColour = c_fuchsia;
			fadeType = 2;
			maxSize = 1.4;
		}
		callout = output;
		alarm[0] = 1;
	}
}

// Combo Bonus
sum += max(global.combo * 50, 0);

// Hard Drop Bonus
sum += drop_points;

score += sum;