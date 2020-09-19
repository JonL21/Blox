/// @func UpdateTilePositions()
/// @desc Updates each position of each tile of block
function UpdateTilePositions() {
	var ts = global.tilesize;
	switch sprite_index {
		case blox.O: tile_pos = [[x,y],[x,y-ts],[x-ts,y],[x-ts,y-ts]]; break;
		case blox.I: 
			switch image_index {
				case 0: tile_pos = [[x,y-ts],[x+ts,y-ts],[x-ts,y-ts],[x-(ts * 2),y-ts]]; break;
				case 1: tile_pos = [[x,y],[x,y-ts],[x,y-(ts * 2)],[x,y+ts]]; break;
				case 2: tile_pos = [[x,y],[x-ts,y],[x-(ts * 2),y],[x+ts,y]]; break;
				case 3: tile_pos = [[x-ts,y],[x-ts,y-ts],[x-ts,y-(ts * 2)],[x-ts,y+ts]]; break;
			}
			break;
		case blox.S:
			switch image_index {
				case 0: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x+(ts / 2),y-(ts * 1.5)]]; break;
				case 1: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x+(ts / 2),y-(ts / 2)],[x+(ts / 2),y+(ts / 2)]]; break;
				case 2: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y+(ts / 2)],[x-(ts / 2),y+(ts / 2)]]; break;
				case 3: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts * 1.5),y-(ts * 1.5)],[x-(ts / 2),y+(ts / 2)]]; break;
			}
			break;
		case blox.Z: 
			switch image_index {
				case 0: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts * 1.5),y-(ts * 1.5)],[x+(ts / 2),y-(ts / 2)]]; break;
				case 1: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x-(ts / 2),y+(ts / 2)],[x+(ts / 2),y-(ts * 1.5)]]; break;
				case 2: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts / 2),y+(ts / 2)],[x+(ts / 2),y+(ts / 2)]]; break;
				case 3: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts * 1.5),y+(ts / 2)]]; break;
			}
			break;
		case blox.T: 
			switch image_index {
				case 0: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x+(ts / 2),y-(ts / 2)]]; break;
				case 1: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x+(ts / 2),y-(ts / 2)],[x-(ts / 2),y+(ts / 2)]]; break;
				case 2: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x-(ts / 2),y+(ts / 2)]]; break;
				case 3: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts / 2),y+(ts / 2)]]; break;
			}
			break;
		case blox.J:
			switch image_index {
				case 0: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x-(ts * 1.5),y-(ts * 1.5)],[x+(ts / 2),y-(ts / 2)]]; break;
				case 1: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x+(ts / 2),y-(ts * 1.5)],[x-(ts / 2),y+(ts / 2)]]; break;
				case 2: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x+(ts / 2),y+(ts / 2)]]; break;
				case 3: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts / 2),y+(ts / 2)],[x-(ts * 1.5),y+(ts / 2)]]; break;
			}
			break;
		case blox.L: 
			switch image_index {
				case 0: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x+(ts / 2),y-(ts * 1.5)]]; break;
				case 1: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts / 2),y+(ts / 2)],[x+(ts / 2),y+(ts / 2)]]; break;
				case 2: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts / 2)],[x+(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y+(ts / 2)]]; break;
				case 3: tile_pos = [[x-(ts / 2),y-(ts / 2)],[x-(ts * 1.5),y-(ts * 1.5)],[x-(ts / 2),y-(ts * 1.5)],[x-(ts / 2),y+(ts / 2)]]; break;
			}
			break;
	}
}