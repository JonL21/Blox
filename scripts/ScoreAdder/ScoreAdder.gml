/// @description  ScoreAdder();

var sum = 0;
var output = "";

switch tspin_type {
	case tspin_check.tspin:
		output += "T-Spin";
		global.tspin = true;
		global.tspinmini = false;
		break;
	case tspin_check.mini:
		output += "T-Spin Mini";
		global.tspin = false;
		global.tspinmini = true;
		break;
	default:
		global.tspin = false;
		global.tspinmini = false;
		break;
}

switch cleared_lines {
    case 0:
        if tspin_type == tspin_check.tspin sum += 100;
        else if tspin_type == tspin_check.mini sum += 400;
        global.b2b = false;
        break;
    case 1:
		if string_length(output) == 0 output += "Single";
		else output += " Single";
        global.singles++;
        if tspin_type == tspin_check.tspin { 
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
            }
            global.b2b = true;
            sum += 800;
            break;
        }
        else if tspin_type == tspin_check.mini {
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
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

sum += max(global.combo * 50, 0);

with o_line_caller { instance_destroy() }
with instance_create(global.border[1] + 128, global.border[3] + 288, o_line_caller) {
	fadeType = 1;
	callout = output;
}

score += sum;
global.total_lines += cleared_lines;
