/// @description  ScoreAdder();

var sum = 0;
var output = ""; // To send to callout

switch tspin_type {
	case tspin_check.tspin:
		output += "T-Spin";
		break;
	case tspin_check.mini:
		output += "T-Spin Mini";
		break;
}

switch cleared_lines {
    case 0:
        if tspin_type == tspin_check.tspin sum += 100;
        else if tspin_type == tspin_check.mini sum += 400;
		global.combo = -1;
        //global.b2b = false;
        break;
    case 1:
		if string_length(output) == 0 output += "Single";
		else output += " Single";
        global.singles++;
        if tspin_type == tspin_check.tspin { 
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
				output = "BACK TO BACK\n" + output;
            }
            global.b2b = true;
            sum += 800;
            break;
        }
        else if tspin_type == tspin_check.mini {
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
				output = "BACK TO BACK\n" + output;
            }
            global.b2b = true;
            sum += 200;
            break;
        }
        else sum += 100;
        global.b2b = false;
        break;
    case 2:
		if string_length(output) == 0 output += "Double";
		else output += " Double";
        global.doubles++;
        if tspin_type == tspin_check.tspin {
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
				output = "BACK TO BACK\n" + output;
            }
            global.b2b = true;
            sum += 1200;
            break;
        }
        else sum += 300;
        global.b2b = false;
        break;
    case 3:
		if string_length(output) == 0 output += "Triple";
		else output += " Triple";
        global.triples++;
        if tspin_type == tspin_check.tspin {
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
				output = "BACK TO BACK\n" + output;
            }
            global.b2b = true;
            sum += 1600;
            break;
        }
        else sum += 500;
        global.b2b = false;
        break;
    case 4:
		output = "Quadruple";
        if global.b2b {
            sum += max(global.combo * 500, 500);
            with o_spawner alarm[2] = 1;
			output = "BACK TO BACK\n" + output;
        }
        global.b2b = true;
        global.quadruples++;
        sum += 800;
        break;
}

// PERFECT CLEAR
if ds_grid_get_max(global.playfield, 0, 0, global.width - 1, global.height * 2 - 1) == -1 {
	sum += 1500;
	output = "ALL CLEAR";
}

// Add combo multiplier
sum += max(global.combo * 50, 0);

var base_x = global.border[1] + 128;
var base_y = global.border[3] + 256;

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

score += sum;
global.total_lines += cleared_lines;