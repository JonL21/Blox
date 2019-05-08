/// @description Back to Main Menu

if instance_exists(o_changeKeyBind) exit;
instance_create_layer(x, y, "Instances", o_title);
instance_destroy();