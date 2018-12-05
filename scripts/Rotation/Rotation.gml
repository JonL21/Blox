/// @description  Rotation

// Rotate by changing image index
var tmp = image_index;
if keyboard_check_pressed(global.C_rotate_left) {
    if tmp - 1 < 0 tmp = 3; // Cycle to last index if at first index
    else tmp--;
}
else if keyboard_check_pressed(global.C_rotate_right) {
    if tmp + 1 > 3 tmp = 0;
    else tmp++;
}
else exit;

image_index = tmp;

// If collision detected, attempt wall kick
/*
    ROTATION GUIDE
    0 - Spawn state
    L - State resulting from CCW rotation from 0
    R - State resulting from CW rotation from 0
    2 - 180 rotation from 0
    
    NOTE: Translations on y-axis are reversed as room origin starts at top left corner.
    e.g. (1, 2) means more 1 unit right and 2 units DOWN on the playfield.
*/
var unit = 32;
// Kicks for CCW
if CC(x, y) && keyboard_check_pressed(global.C_rotate_left) {
    // Wall kicks for I block
    if sprite_index == spr_I {
        switch tmp {
            case 0: // R -> 0
                // Test 2 (2, 0)
                if !CC(x + unit * 2, y) x += unit * 2;
                
                // Test 3 (-1, 0)
                else if !CC(x - unit, y) x -= unit;
                
                // Test 4 (2, 1)
                else if !CC(x + (unit * 2), y - unit) { x += unit * 2; y -= unit; }
                
                // Test 5 (-1, -2)
                else if !CC(x - unit, y + (unit * 2)) { x -= unit; y += unit * 2 }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 1;
                    exit;
                }
                break;
            case 1: // 2 -> R
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (-2, 0)
                else if !CC(x - (unit * 2), y) x -= unit * 2;
                
                // Test 4 (1, -2)
                else if !CC(x + unit, y + (unit * 2)) { x += unit; y += unit * 2; }
                
                // Test 5 (-2, 1)
                else if !CC(x - (unit * 2), y - unit) { x -= unit * 2; y -= unit; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 2;
                    exit;
                }
                break;
            case 2: // L -> 2
                // Test 2 (-2, 0)
                if !CC(x - unit * 2, y) x -= unit * 2;
                
                // Test 3 (1, 0)
                else if !CC(x + unit, y) x += unit;
                
                // Test 4 (-2, -1)
                else if !CC(x - unit * 2, y + unit) { x -= unit * 2; y += unit; }
                
                // Test 5 (1, 2)
                else if !CC(x + unit, y - unit * 2) { x += unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 3;
                    exit;
                }
                break;
            case 3: // 0 -> L
                // Test 2 (-1, 0)
                if !CC(x - unit, y) x -= unit;
                
                // Test 3 (2, 0)
                else if !CC(x + unit * 2, y) x += unit * 2;
                
                // Test 4 (-1, 2)
                else if !CC(x - unit, y - unit * 2) { x -= unit; y -= unit * 2; }
                
                // Test 5 (2, -1)
                else if !CC(x + unit * 2, y + unit) { x += unit * 2; y += unit; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 0;
                    exit;
                }
                break;
        }
    }
    // Wall kicks for J/L/S/T/Z blocks
    else if sprite_index != spr_O {
        switch tmp {
            case 0: // R -> 0
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (1, -1)
                else if !CC(x + unit, y + unit) { x += unit; y += unit; }
                
                // Test 4 (0, 2)
                else if !CC (x, y - unit * 2) y -= unit * 2;
                
                // Test 5 (1, 2)
                else if !CC (x + unit, y - unit * 2) { x += unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 1;
                    exit;
                }
                break;
            case 1: // 2 -> R
                // Test 2 (-1, 0)
                if !CC (x - unit, y) x -= unit;
                
                // Test 3 (-1, 1)
                else if !CC(x - unit, y - unit) { x -= unit; y -= unit; }
                
                // Test 4 (0, -2)
                else if !CC(x, y + unit * 2) { y += unit * 2; }
                
                // Test 5 (-1, -2)
                else if !CC(x - unit, y + unit * 2) { x -= unit; y += unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 2;
                    exit;
                }
                break;
            case 2: // L -> 2
                // Test 2 (-1, 0)
                if !CC(x - unit, y) x -= unit;
                
                // Test 3 (-1, -1)
                else if !CC(x - unit, y + unit) { x -= unit; y += unit; }
                
                // Test 4 (0, 2)
                else if !CC(x, y - unit * 2) y -= unit * 2;
                
                // Test 5 (-1, 2)
                else if !CC(x - unit, y - unit * 2) { x -= unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 3;
                    exit;
                }
                break;
            case 3: // 0 -> L
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (1, 1)
                else if !CC(x + unit, y - unit) { x += unit; y -= unit; }
                
                // Test 4 (0, -2)
                else if !CC(x, y + unit * 2) y += unit * 2;
                
                // Test 5 (1, -2)
                else if !CC(x + unit, y + unit * 2) { x += unit; y += unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 0;
                    exit;
                }
                break;
        }
    }
}
else if CC(x, y) && keyboard_check_pressed(global.C_rotate_right) {
    // Wall kicks for I block
    if sprite_index == spr_I {
        switch tmp {
            case 0: // L -> 0
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (-2, 0)
                else if !CC(x - (unit * 2), y) x -= unit * 2;
                
                // Test 4 (1, -2)
                else if !CC(x + unit, y + (unit * 2)) { x += unit; y += unit * 2; }
                
                // Test 5 (-2, 1)
                else if !CC(x - (unit * 2), y - unit) { x -= unit * 2; y -= unit; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 3;
                    exit;
                }
                break;
            case 1: // 0 -> R
                // Test 2 (-2, 0)
                if !CC(x - unit * 2, y) x -= unit * 2;
                
                // Test 3 (1, 0)
                else if !CC(x + unit, y) x += unit;
                
                // Test 4 (-2, -1)
                else if !CC(x - unit * 2, y + unit) { x -= unit * 2; y += unit; }
                
                // Test 5 (1, 2)
                else if !CC(x + unit, y - unit * 2) { x += unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 0;
                    exit;
                }
                break;
            case 2: // R -> 2
                // Test 2 (-1, 0)
                if !CC(x - unit, y) x -= unit;
                
                // Test 3 (2, 0)
                else if !CC(x + unit * 2, y) x += unit * 2;
                
                // Test 4 (-1, 2)
                else if !CC(x - unit, y - unit * 2) { x -= unit; y -= unit * 2; }
                
                // Test 5 (2, -1)
                else if !CC(x + unit * 2, y + unit) { x += unit * 2; y += unit; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 1;
                    exit;
                }
                break;
            case 3: // 2 -> L
                // Test 2 (2, 0)
                if !CC(x + unit * 2, y) x += unit * 2;
                
                // Test 3 (-1, 0)
                else if !CC(x - unit, y) x -= unit;
                
                // Test 4 (2, 1)
                else if !CC(x + (unit * 2), y - unit) { x += unit * 2; y -= unit; }
                
                // Test 5 (-1, -2)
                else if !CC(x - unit, y + (unit * 2)) { x -= unit; y += unit * 2 }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 2;
                    exit;
                }
                break;
        }
    }
    // Wall kicks for J/L/S/T/Z blocks
    else if sprite_index != spr_O {
        switch tmp {
            case 0: // L -> 0
                // Test 2 (-1, 0)
                if !CC (x - unit, y) x -= unit;
                
                // Test 2.5 (-1, -1) [T-SPIN SPECIAL]
                else if !CC(x - unit, y + unit) && sprite_index == spr_T { x -= unit; y += unit; }
                
                // Test 3 (-1, 1)
                else if !CC(x - unit, y - unit) { x -= unit; y -= unit; }
                
                // Test 4 (0, -2)
                else if !CC(x, y + unit * 2) { y += unit * 2; }
                
                // Test 5 (-1, -2)
                else if !CC(x - unit, y + unit * 2) { x -= unit; y += unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 3;
                    exit;
                }
                break;
            case 1: // 0 -> R
                // Test 2 (-1, 0)
                if !CC(x - unit, y) x -= unit;
                
                // Test 3 (-1, -1)
                else if !CC(x - unit, y + unit) { x -= unit; y += unit; }
                
                // Test 4 (0, 2)
                else if !CC(x, y - unit * 2) y -= unit * 2;
                
                // Test 5 (-1, 2)
                else if !CC(x - unit, y - unit * 2) { x -= unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 0;
                    exit;
                }
                break;
            case 2: // R -> 2
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (1, -1)
                else if !CC(x + unit, y + unit) { x += unit; y += unit; }
                
                // Test 4 (0, 2)
                else if !CC (x, y - unit * 2) y -= unit * 2;
                
                // Test 5 (1, 2)
                else if !CC (x + unit, y - unit * 2) { x += unit; y -= unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 1;
                    exit;
                }
                break;
            case 3: // 2 -> L
                // Test 2 (1, 0)
                if !CC(x + unit, y) x += unit;
                
                // Test 3 (1, 1)
                else if !CC(x + unit, y - unit) { x += unit; y -= unit; }
                
                // Test 4 (0, -2)
                else if !CC(x, y + unit * 2) y += unit * 2;
                
                // Test 5 (1, -2)
                else if !CC(x + unit, y + unit * 2) { x += unit; y += unit * 2; }
                
                // Tests Failed: Revert rotation
                else {
                    image_index = 2;
                    exit;
                }
                break;
        }
    }
}
else { 
    last_move = successful_move.rotation;
}
last_move = successful_move.kick;

if (keyboard_lastkey == global.C_rotate_left || keyboard_lastkey == global.C_rotate_right) && lockdown && alarm[1] > 0 && lock_cancels != 0 {
    lock_cancels = max(lock_cancels - 1, 0);
    alarm[1] = 30;
}
