// Movement

// Reset delay for shifting
if keyboard_check_released(global.C_left) || keyboard_check_released(global.C_right) das = 0;

// Shift block towards a wall
if keyboard_check(global.C_left) {
    das = max(das - 1, -shift_delay);
    if das == -shift_delay && !CC(x - 32, y)  {
        x -= 32;
        last_move = successful_move.left_right;
        if lockdown && alarm[1] > 0 && lock_cancels != 0 {
            lock_cancels = max(lock_cancels - 1, 0);
            alarm[1] = 30;
        }
    }
}
else if keyboard_check(global.C_right) {
    das = min(das + 1, shift_delay);
    if das == shift_delay && !CC(x + 32, y) {
        x += 32;
        last_move = successful_move.left_right;
        if lockdown && alarm[1] > 0 && lock_cancels != 0 {
            lock_cancels = max(lock_cancels - 1, 0);
            alarm[1] = 30;
        }
    }
}
// Soft Drop
else if keyboard_check(global.C_soft_drop) && !CC(x, y + 32) {
    y += 32;
    last_move = successful_move.soft_drop;
}

// Hard Drop
if keyboard_check_pressed(global.C_hard_drop) {
    last_move = successful_move.hard_drop;
    move_contact_solid(270, -1);
    alarm[0] = -1;
    alarm[1] = 1;
    exit;
}
// Move block one unit horizontally
else if keyboard_check_pressed(global.C_left) && !CC(x - 32, y) {
    last_move = successful_move.left_right;
    x -= 32; 
    if lockdown && alarm[1] > 0 && lock_cancels != 0 {
        lock_cancels = max(lock_cancels - 1, 0);
        alarm[1] = 30;
    }
}
else if keyboard_check_pressed(global.C_right) && !CC(x + 32, y) {
    last_move = successful_move.left_right;
    x += 32;
    if lockdown && alarm[1] > 0 && lock_cancels != 0 {
        lock_cancels = max(lock_cancels - 1, 0);
        alarm[1] = 30;
    }
}
