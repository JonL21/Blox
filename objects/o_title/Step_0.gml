/// @description
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