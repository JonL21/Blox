/// @description  Go up one option

if menu_select - 1 < 0 menu_select = array_length_1d(menu_options) - 1;
else menu_select--;