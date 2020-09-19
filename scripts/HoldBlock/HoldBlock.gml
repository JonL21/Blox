/// @func HoldBlock()
/// @desc Logic for holding/swaping hold block
function HoldBlock() {

	if solid exit;
	if board_id.hold_available && keyboard_check_pressed(global.C_hold) {
	    board_id.hold_available = false;
		// If no hold block, hold this block('s sprite), and spawn new block
	    if board_id.held_block == -1 {
	        board_id.held_block = sprite_index;
			instance_destroy(ghost_block_id);
			solid = true;
	        instance_destroy();
	    }
		// Else swap block (sprites) and reset lockdown variables and reset position to spawn
	    else {
	        // Swap sprites
	        var temp = board_id.held_block;
	        board_id.held_block = sprite_index;
	        sprite_index = temp;
	        image_index = 0;
        
			// Reset technicals
		    lock_cancels = global.lock_cancels;
		    lockdown = false;
			lockdown_alpha = 1;
		    alarm[1] = -1;
			das = 0;
			last_move = successful_move.none;
			tspin_type = tspin_check.none;
		
	        // Reset position
	        x = board_id.x;
	        y = board_id.y;
	        if sprite_index == blox.I { y += 2 * global.tilesize; }
	        else if sprite_index == blox.O { y += global.tilesize; }
	        else { x -= (global.tilesize / 2); y += (global.tilesize * 1.5); }
			UpdateTilePositions();
			if CC(0, 0) && !CC(0, -global.tilesize) {
				y -= global.tilesize;
				UpdateTilePositions()
			}
	        alarm[0] = 1;
	    }
		keyboard_clear(global.C_hard_drop);
	}
}
