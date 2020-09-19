/// @description Local Variables

y = room_height * 2;

// Available Options
menu_options[0] = "Shift Delay";
menu_options[1] = "Repeat Delay";
menu_options[2] = "Drop Factor";
menu_options[3] = "Show Particle Effects";
menu_options[4] = "Show Callouts";
menu_options[5] = "Reset All Preferences";
menu_options[6] = "Reset All Leaderboards";
menu_options[7] = "Edit Controls";
menu_options[8] = "Back";

// Option Descriptions
menu_explain[0] = "Change how many frames before the block starts auto-shifting towards a wall";
menu_explain[1] = "Change how many frames between each auto shift";
menu_explain[2] = "Change the factor at which soft dropping affects the block's gravity";
menu_explain[3] = "Change whether or not to show particle effects for hard dropping, line clears";
menu_explain[4] = "Change whether to show callouts for only certain line clears, all, or none at all";
menu_explain[5] = "Reset all preferences to their defaults";
menu_explain[6] = "Wipe scores off every leaderboard";
menu_explain[7] = "Change key bindings";
menu_explain[8] = "Return to main menu";

// Menu Cursor and Scaling
menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);
scales[menu_select] = 1;