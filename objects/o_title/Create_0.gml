/// @description  Local Variables

// Available Options
menu_options[0] = "Marathon";
menu_options[1] = "Ultra";
menu_options[2] = "Sprint";
menu_options[3] = "Quit";

menu_select = 0;

scales[array_length_1d(menu_options) - 1] = 0.5;
for (var i = 0; i < array_length_1d(menu_options); i++) { 
    scales[i] = 0.5;
}

scales[menu_select] = 1;

