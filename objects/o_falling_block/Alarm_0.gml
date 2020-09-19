/// @description Auto Falling
if !CC(0, global.tilesize) {
	// For slow speeds
	if board_id.level < 15 {
	    y += global.tilesize;
		UpdateTilePositions();
		alarm[0] = CalculateSpeed();
	}
	// For faster speeds
	else {
		var rows = 1;
        switch(board_id.level) {
            default: rows += 5;
            case 19: rows += 5;
            case 18: rows += 5;
            case 17: rows += 2;
            case 16: rows += 1;
            case 15: rows += 1;
        }
        while rows > 0 && !CC(0, global.tilesize) {
            y += global.tilesize;
            UpdateTilePositions();
            rows--;
        }
        alarm[0] = 1;
	}
	audio_play_sound(snd_fall, 1, false);
}