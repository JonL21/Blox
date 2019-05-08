/// @func HoldBlock()
/// @desc Logic for holding/swaping hold block

if global.hold_available && keyboard_check_pressed(global.C_hold) {
    global.hold_available = false;
	// If no hold block, hold this block('s sprite), and spawn new block
    if global.held_block == -1 {
        global.held_block = sprite_index;
        with o_spawner alarm[1] = 1;
        instance_destroy();
    }
	// Else swap block (sprites) and reset lockdown variables and reset position to spawn
    else {
        // Swap sprites
        var temp = global.held_block;
        global.held_block = sprite_index;
        sprite_index = temp;
        image_index = 0;
        
		// Reset technicals
	    lock_cancels = 15;
	    lockdown = false;
	    alarm[1] = -1;
		
        // Reset position
        x = o_spawner.x;
        y = o_spawner.y;
        if sprite_index == spr_I { y += 64; }
        else if sprite_index == spr_O { y += 32; }
        else { x -= 16; y += 48; }
		UpdateTilePositions();
        alarm[0] = 5;
    }
}