/// @description  Drop a block from bag

// Take a block from the bag
var next_spr = ds_list_find_value(global.bag, 0);
ds_list_delete(global.bag, 0);

var iid;
// Some blocks have specific spawn positions
// instance_create_depth(posx, posy, object_get_depth(o_grid), o_grid);
if next_spr == spr_I iid = instance_create_layer(x, y + 64, "Instances", o_falling_block);
else if next_spr == spr_O iid = instance_create_layer(x, y + 32, "Instances", o_falling_block);
else iid = instance_create_layer(x - 16, y + 48, "Instances", o_falling_block);

// Set the sprite of the falling block
with iid {
	sprite_index = next_spr;
	switch sprite_index {
		case spr_O: tile_pos = [[x,y],[x,y-32],[x-32,y],[x-32,y-32]]; break;
		case spr_I: tile_pos = [[x,y-32],[x+32,y-32],[x-32,y-32],[x-64,y-32]]; break;
		case spr_S: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-48]]; break;
		case spr_Z: tile_pos = [[x-16,y-16],[x-16,y-48],[x-48,y-48],[x+16,y-16]]; break;
		case spr_T: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-16]]; break;
		case spr_J: tile_pos = [[x-16,y-16],[x-48,y-16],[x-48,y-48],[x+16,y-16]]; break;
		case spr_L: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x+16,y-48]]; break;
	}
	alarm_set(0, 60 / global.fall_speed);
}

// Add new blocks to bag if emptying out
if ds_list_size(global.bag) <= 7 BagGenerator();