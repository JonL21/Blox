if global.game_over exit;
if CC(0, 32) && !lockdown {
	lock_cancels = max(lock_cancels - 1, 0);
    lockdown = true;
    alarm_set(1, lock_delay);
}
script_execute(GhostBlock);
script_execute(HoldBlock);
script_execute(Rotation);
script_execute(Movement);