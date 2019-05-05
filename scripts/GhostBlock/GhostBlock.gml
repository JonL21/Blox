/// @description Preview of block placement

var gb = instance_create_layer(x, y, "Instances", o_ghost_block);
gb.image_speed = 0;
gb.image_alpha = 0.35;
gb.sprite_index = sprite_index;
gb.image_index = image_index;
with gb {
	switch sprite_index {
		case spr_O: tile_pos = [[x,y],[x,y-32],[x-32,y],[x-32,y-32]]; break;
		case spr_I: tile_pos = [[x,y-32],[x+32,y-32],[x-32,y-32],[x-64,y-32]]; break;
		case spr_S: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-48]]; break;
		case spr_Z: tile_pos = [[x-16,y-16],[x-16,y-48],[x-48,y-48],[x+16,y-16]]; break;
		case spr_T: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-16]]; break;
		case spr_J: tile_pos = [[x-16,y-16],[x-48,y-16],[x-48,y-48],[x+16,y-16]]; break;
		case spr_L: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x+16,y-48]]; break;
	}
	move_contact_solid(270,-1);
}