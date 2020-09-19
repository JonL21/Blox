/// @func KeyToString(val)
/// @desc Attempts to convert key value to String
/// @arg {Integer} val Unicode code value
function KeyToString(argument0) {
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
}

/// @func FormatNum(number)
/// @desc Adds commas while formatting a number to string
/// @arg {Integer} number the number to format
function FormatNum(argument0) {
	var str = string_digits(argument0);
	for (var i = string_length(str) - 2; i > 1; i -= 3) {
		str = string_insert(",", str, i);	
	}
	return str;
}

/// @func FormatTime(number)
/// @desc Format a number to XX:XX format
/// @arg {Integer} number the number to format
function FormatTime(argument0) {
	var milli = frac(argument0) > 0 ? string_copy(string(frac(argument0)), 2, 3) : ".00";
	var seconds = argument0 % 60 >= 10 ? string(floor(argument0 % 60)) : "0" + string(floor(argument0 % 60));
	var minutes = floor(argument0 / 60) >= 10 ? string(floor(argument0 / 60)) : "0" + string(floor(argument0 / 60));
	return minutes + ":" + seconds + milli;
}

/// @func draw_text_shadow(x, y, string, colour)
/// @desc Draws text with text shadow
function draw_text_shadow(xx, yy, str, col) {
	draw_text_colour(xx + 2, yy + 2, str, col, col, col, col, 0.5);
	draw_text(xx, yy, str);
}

/// @func draw_text_trf_shadow(x, y, string, scale, colour)
/// @desc Draws text with text shadow
function draw_text_trf_shadow(xx, yy, str, scale, col) {
	draw_text_transformed_colour(xx + 2, yy + 2 - scale * 32, str, scale, scale, 0, col, col, col, col, 0.5);
	draw_text_transformed(xx, yy - scale * 32, str, scale, scale, 0);
}