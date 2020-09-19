/// @func GhostBlock()
/// @desc Preview of block placement
function GhostBlock() {
	
	if solid exit;
	if instance_exists(ghost_block_id)
		instance_destroy(ghost_block_id);
	
	with instance_create_layer(x, y, "Instances", o_ghost_block) {
		other.ghost_block_id = id;
		board_id = other.board_id;
		image_speed = 0;
		image_alpha = 0.35;
		sprite_index = other.sprite_index;
		image_index = other.image_index;
		tile_pos = array_create(4);
		UpdateTilePositions();
		while !CC(0, global.tilesize) {
            y += global.tilesize;
            UpdateTilePositions();
        }
	}
}
