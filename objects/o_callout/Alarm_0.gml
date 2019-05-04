/// @description Update variables

if !place_empty(x, y, o_callout) {
	if string_count("BACK TO BACK", callout) == 1 {
		with o_callout {
			if type == other.type && self.id != other.id
				y += string_height(callout) + 16;
		}
	}
	else {
		with o_callout 
			if type == other.type && self.id != other.id
				y += 32;
	}
}

fadeDelay *= room_speed;
alarm[3] = 1;
alarm_set(fadeType, fadeDelay);