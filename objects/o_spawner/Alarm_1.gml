/// @description  Drop a block from bag

if global.game_over exit;

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
	UpdateTilePositions();
	if CC(0, 0) {
		if CC(0, -32) {
			global.game_over = true;
			other.alarm[5] = 1;
			alarm_set(1, 1);
		}
		else {
			y -= 32;
			UpdateTilePositions();	
		}
	}
	alarm[0] = CalculateSpeed();
}

// Add new blocks to bag if emptying out
if ds_list_size(global.bag) <= 7 BagGenerator();