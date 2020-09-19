/// @description Spacing

life++;
if !solid exit;
var c = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,o_callout,false,true);
if c != noone && !moving && c != id && c.life < life && type != callout_type.combo {
	newy = c.y + c.sprite_height;
	moving = true;
}

if type == callout_type.combo exit;

if moving {
    y = mean(y, newy);
    if abs(newy - y) < 1 {
        y = newy;
		newy = 0;
        moving = false;
    }
}