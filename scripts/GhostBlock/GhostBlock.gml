/// @func GhostBlock()
/// @desc Preview of block placement

var gb = instance_create_layer(x, y, "Instances", o_ghost_block);
gb.image_speed = 0;
gb.image_alpha = 0.35;
gb.sprite_index = sprite_index;
gb.image_index = image_index;
with gb move_contact_solid(270,-1);