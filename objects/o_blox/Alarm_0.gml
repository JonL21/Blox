/// @description Update speed when level up

speed -= (board_id.level - 1) * 1.5;
speed += min(board_id.level * 1.5, 40);
fall_speed = speed;