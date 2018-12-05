/// @description  Local Variables

// Available Options
menu_options[0] = "Play";
menu_options[1] = "Colin's Corner";
menu_options[2] = "Quit";

menu_select = 0;

scales[array_length_1d(menu_options) - 1] = 0.5;
for (var i = 0; i < array_length_1d(menu_options); i++) { 
    scales[i] = 0.5;
}

scales[menu_select] = 1;

