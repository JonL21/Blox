/// @description Update Preferences in Ini
ini_open("settings.ini");
ini_write_real("Preferences", "Shift_Delay", global.shift_delay);
ini_write_real("Preferences", "Repeat_Delay", global.repeat_delay);
ini_write_real("Preferences", "Drop_Factor", global.drop_factor);
ini_write_real("Preferences", "Particle_Effects", global.particle_effects);
ini_write_real("Preferences", "Show_Callouts", global.show_callouts);
ini_close();