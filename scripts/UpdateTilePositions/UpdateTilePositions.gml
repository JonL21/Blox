/// @func UpdateTilePositions()
/// @desc Updates each position of each tile of block

switch sprite_index {
	case spr_O: tile_pos = [[x,y],[x,y-32],[x-32,y],[x-32,y-32]]; break;
	case spr_I: 
		switch image_index {
			case 0: tile_pos = [[x,y-32],[x+32,y-32],[x-32,y-32],[x-64,y-32]]; break;
			case 1: tile_pos = [[x,y],[x,y-32],[x,y-64],[x,y+32]]; break;
			case 2: tile_pos = [[x,y],[x-32,y],[x-64,y],[x+32,y]]; break;
			case 3: tile_pos = [[x-32,y],[x-32,y-32],[x-32,y-64],[x-32,y+32]]; break;
		}
		break;
	case spr_S:
		switch image_index {
			case 0: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-48]]; break;
			case 1: tile_pos = [[x-16,y-16],[x-16,y-48],[x+16,y-16],[x+16,y+16]]; break;
			case 2: tile_pos = [[x-16,y-16],[x+16,y-16],[x-48,y+16],[x-16,y+16]]; break;
			case 3: tile_pos = [[x-16,y-16],[x-48,y-16],[x-48,y-48],[x-16,y+16]]; break;
		}
		break;
	case spr_Z: 
		switch image_index {
			case 0: tile_pos = [[x-16,y-16],[x-16,y-48],[x-48,y-48],[x+16,y-16]]; break;
			case 1: tile_pos = [[x-16,y-16],[x+16,y-16],[x-16,y+16],[x+16,y-48]]; break;
			case 2: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y+16],[x+16,y+16]]; break;
			case 3: tile_pos = [[x-16,y-16],[x-16,y-48],[x-48,y-16],[x-48,y+16]]; break;
		}
		break;
	case spr_T: 
		switch image_index {
			case 0: tile_pos = [[x-16,y-16],[x-48,y-16],[x-16,y-48],[x+16,y-16]]; break;
			case 1: tile_pos = [[x-16,y-16],[x-16,y-48],[x+16,y-16],[x-16,y+16]]; break;
			case 2: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x-16,y+16]]; break;
			case 3: tile_pos = [[x-16,y-16],[x-16,y-48],[x-48,y-16],[x-16,y+16]]; break;
		}
		break;
	case spr_J:
		switch image_index {
			case 0: tile_pos = [[x-16,y-16],[x-48,y-16],[x-48,y-48],[x+16,y-16]]; break;
			case 1: tile_pos = [[x-16,y-16],[x-16,y-48],[x+16,y-48],[x-16,y+16]]; break;
			case 2: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x+16,y+16]]; break;
			case 3: tile_pos = [[x-16,y-16],[x-16,y-48],[x-16,y+16],[x-48,y+16]]; break;
		}
		break;
	case spr_L: 
		switch image_index {
			case 0: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x+16,y-48]]; break;
			case 1: tile_pos = [[x-16,y-16],[x-16,y-48],[x-16,y+16],[x+16,y+16]]; break;
			case 2: tile_pos = [[x-16,y-16],[x-48,y-16],[x+16,y-16],[x-48,y+16]]; break;
			case 3: tile_pos = [[x-16,y-16],[x-48,y-48],[x-16,y-48],[x-16,y+16]]; break;
		}
		break;
}