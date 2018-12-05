/// @description  ScoreAdder();

var sum = 0;

/* Check for T-Spin
    Criteria:
    1 - Last successful move was a rotation
    2 - Three of the four adjacent corners around of the t-block are occupied by a wall/block
    3 - BOTH corners directy adjacent to the "pointy end" of the t-block are occupied
    
    If above are true and 1/2/3 lines are cleared: classified as T-Spin Single/Double/Triple.
   
    FOR MINI:
    1 - Last successful move was a kick
    2 - The block directly adjacent to the "pointy end" of the t-block is open
    Only T-Spin Minis and T-Spin Mini Singles are possible.
    
    NOTE: The T-Spin triple acheived with a kick does NOT count as a mini, but an actual t-spin
    
    All T-Spins qualify for Back-to-Back combos alongside Tetrises.
*/
global.tspin = false;
global.tspinmini = false;

if sprite_index == spr_T {
    occupied_corner = 0;
    occupied_point = false;
    if !place_free(x - 32, y - 32) occupied_corner++;
    if !place_free(x + 32, y - 32) occupied_corner++;
    if !place_free(x - 32, y + 32) occupied_corner++;
    if !place_free(x + 32, y + 32) occupied_corner++;
    
    switch image_index {
        case 0: if (!place_free(x - 32, y - 32) && !place_free(x + 32, y - 32)) occupied_point = true; break;
        case 1: if (!place_free(x + 32, y - 32) && !place_free(x + 32, y + 32)) occupied_point = true; break;
        case 2: if (!place_free(x - 32, y + 32) && !place_free(x + 32, y + 32)) occupied_point = true; break;
        case 3: if (!place_free(x - 32, y - 32) && !place_free(x - 32, y + 32)) occupied_point = true; break;
    }
    
    if occupied_corner >= 3 {
        if (last_move == successful_move.rotation && occupied_point) || (cleared_lines >= 2 && occupied_point) {
            global.tspin = true;
        }
        else if (last_move == successful_move.kick && cleared_lines <= 1) {
            global.tspinmini = true;
        }
    }
    
}

switch cleared_lines {
    case 0:
        if global.tspin sum += 100;
        else if global.tspinmini sum += 400;
        global.b2b = false;
        break;
    case 1:
        global.singles++;
        if global.tspin { 
            if global.b2b {
                sum += max(global.combo * 500, 500);
                with o_spawner alarm[2] = 1;
            }
            global.b2b = true;
            sum += 800;
            break;
        }
        else if global.tspinmini {
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
        global.doubles++;
        if global.tspin {
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
        global.triples++;
        if global.tspin {
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
}

sum += max(global.combo * 50, 0);

score += sum;
global.total_lines += cleared_lines;
