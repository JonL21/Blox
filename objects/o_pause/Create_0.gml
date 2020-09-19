/// @description Menu

menu_options[0] = "Resume";
menu_options[1] = "Restart";
menu_options[2] = "Main Menu";

menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);

menu_select = 0;
scales[0] = 1;

//surf = -1;
//usize = shader_get_uniform(shd_blur, "size");