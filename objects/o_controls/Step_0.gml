/// @description Movement

// Move submenu with options menu
y = o_options.y;

// Move control options within room if controls was selected
if global.show_control_options x = mean(x, room_width / 2);
else x = mean(x, room_width * 2);

// Menu Cursor and Scaling
for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}