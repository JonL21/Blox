/// @description Menu Movement

// Move Main Menu offscreen if options was selected
if global.show_options y = mean(y, -room_height);	
else y = mean(y, room_height / 2);

// Move specific scoreboard based on menu cursor
switch menu_select {
    case 0:
		with sb_mar x = max(x - 30, other.sb_clamp_low);
		with sb_ult x = min(x + 30, other.sb_clamp_high);
		with sb_spr x = min(x + 30, other.sb_clamp_high);
        break;
	case 1:
		with sb_mar x = min(x + 30, other.sb_clamp_high);
		with sb_ult x = max(x - 30, other.sb_clamp_low);
		with sb_spr x = min(x + 30, other.sb_clamp_high);
        break;
	case 2:
		with sb_mar x = min(x + 30, other.sb_clamp_high);
		with sb_ult x = min(x + 30, other.sb_clamp_high);
		with sb_spr x = max(x - 30, other.sb_clamp_low);
        break;
	default:
		with sb_mar x = min(x + 30, other.sb_clamp_high);
		with sb_ult x = min(x + 30, other.sb_clamp_high);
		with sb_spr x = min(x + 30, other.sb_clamp_high);
		break;
}

// Adjust scaling based on menu cursor
for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}