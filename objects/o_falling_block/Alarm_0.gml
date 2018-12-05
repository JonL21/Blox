/// @description  Auto Falling
if solid exit;

if !CC(x, y + 32) {
    y += 32;
}
else {
    lockdown = true;
    alarm_set(1, lock_delay);
}
alarm_set(0, 60 / 1);