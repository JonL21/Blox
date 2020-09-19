/// @func KeyToString(val)
/// @desc Attempts to convert key value to String
/// @arg {Integer} val Unicode code value

var key_str = "";
if argument0 >= 48 && argument0 <= 90
		key_str = string_lettersdigits(chr(argument0));
	else {
		switch (argument0) {
			case vk_enter: key_str = "Enter"; break;
			case vk_left: key_str = "Left Arrow Key"; break;
			case vk_right: key_str = "Right Arrow Key"; break;
			case vk_up: key_str = "Up Arrow Key"; break;
			case vk_down: key_str = "Down Arrow Key"; break;
			case vk_escape: key_str = "Escape"; break;
			case vk_space: key_str = "Space"; break;
			case vk_shift: key_str = "Shift"; break;
			case vk_control: key_str = "Control"; break;
			case vk_alt: key_str = "Alt"; break;
			case vk_backspace: key_str = "Backspace"; break;
			case vk_tab: key_str = "Tab"; break;
			case vk_numpad0: key_str = "Numpad 0"; break;
			case vk_numpad1: key_str = "Numpad 1"; break;
			case vk_numpad2: key_str = "Numpad 2"; break;
			case vk_numpad3: key_str = "Numpad 3"; break;
			case vk_numpad4: key_str = "Numpad 4"; break;
			case vk_numpad5: key_str = "Numpad 5"; break;
			case vk_numpad6: key_str = "Numpad 6"; break;
			case vk_numpad7: key_str = "Numpad 7"; break;
			case vk_numpad8: key_str = "Numpad 8"; break;
			case vk_numpad9: key_str = "Numpad 9"; break;
			case vk_multiply: key_str = "Numpad *"; break;
			case vk_divide: key_str = "Numpad /"; break;
			case vk_add: key_str = "Numpad +"; break;
			case vk_subtract: key_str = "Numpad -"; break;
			case vk_decimal: key_str = "Numpad ."; break;
		}
	}
return key_str;