/// @description Preview of block placement

var gb = instance_create_layer(x, y, "Instances", o_ghost_block);
gb.image_speed = 0;
gb.image_alpha = 0.5;
gb.sprite_index = sprite_index;
gb.image_index = image_index;
with gb {
    while true {
        if !CC(x, y + 32) {
            y += 32;
        } else break;
    }
}