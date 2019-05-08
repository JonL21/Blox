/// @description  Go down one option

if instance_exists(o_changeKeyBind) exit;
if menu_select + 1 == array_length_1d(menu_options) menu_select = 0;
else menu_select++;