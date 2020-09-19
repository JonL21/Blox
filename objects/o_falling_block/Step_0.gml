/// @description Mobility

// Exit out of step event if lock down process (Alarm 1) has already begun
if solid exit;

// Adjust lockdown visual effect
if lockdown_alpha < 1
	lockdown_alpha = min(lockdown_alpha + (1 / global.lock_delay), 1);

// Set lockdown if conditions met
if CC(0, global.tilesize) && !lockdown {
    lockdown = true;
	lockdown_alpha = 0;
    alarm[1] = global.lock_delay;
}

HoldBlock();
Rotation();
Movement();
GhostBlock();