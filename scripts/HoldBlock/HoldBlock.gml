/// @description  HoldBlock()

if hold_available && keyboard_check_pressed(vk_shift) {
    hold_available = false;
    alarm[0] = -1;
    if global.held_block == -1 {
        global.held_block = sprite_index;
        with o_spawner alarm[1] = 1;
        instance_destroy();
    }
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
        alarm[0] = 5;
    }
}
