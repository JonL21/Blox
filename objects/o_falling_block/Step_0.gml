/// @description Mobility
if global.game_over exit;
if CC(0, 32) && !lockdown {
    lockdown = true;
    alarm[1] = lock_delay;
}
GhostBlock();
HoldBlock();
Rotation();
Movement();