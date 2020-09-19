/// @description  Drop a block from bag

if game_over exit;

// Take a block from the bag
var next_spr = ds_list_find_value(bag, 0);
ds_list_delete(bag, 0);

var iid;
// Some blocks have specific spawn positions
if next_spr == blox.I iid = instance_create_layer(x, y + global.tilesize * 2, "Instances", o_falling_block);
else if next_spr == blox.O iid = instance_create_layer(x, y + global.tilesize, "Instances", o_falling_block);
else iid = instance_create_layer(x - global.tilesize / 2, y + global.tilesize * 1.5, "Instances", o_falling_block);

// Set the sprite of the falling block
with iid {
	board_id = other.id;
	sprite_index = next_spr;
	UpdateTilePositions();
	if CC(0, 0) {
		if CC(0, -global.tilesize) {
			other.game_over = true;
			other.alarm[5] = 1;
			solid = true;
			instance_destroy();
		}
		else {
			y -= global.tilesize;
			UpdateTilePositions()
			alarm[0] = other.level < 15 ? CalculateSpeed() : 1;	
		}
	}
	else alarm[0] = other.level < 15 ? CalculateSpeed() : 1;
}
b = iid;

// Add new blocks to bag if emptying out
if ds_list_size(bag) <= 7 BagGenerator();