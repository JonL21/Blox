/// @description Movement

// Move menu within room if options was selected
if global.show_options y = mean(y, room_height / 2);
else y = mean(y, 2 * room_height);

// Move menu to left of room if controls submenu was selected
if global.show_control_options x = mean(x, -room_width);
else x = mean(x, room_width / 2);

// Adjust scaling based on menu cursor
for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}