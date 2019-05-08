/// @desc Enums and Macros

#macro DEFAULT_LEFT vk_left
#macro DEFAULT_RIGHT vk_right
#macro DEFAULT_SOFT_DROP vk_down
#macro DEFAULT_HARD_DROP vk_space
#macro DEFAULT_HOLD vk_shift
#macro DEFAULT_ROTATE_LEFT ord("Z")
#macro DEFAULT_ROTATE_RIGHT ord("X")

// Enum for Block Sprites
enum blox {
	O = spr_O,
	I = spr_I,
	S = spr_S,
	Z = spr_Z,
	T = spr_T,
	J = spr_J,
	L = spr_L
}

// Enum for game mode
enum mode {
	marathon = 0,
	ultra = 1,
	sprint = 2,
}

// Enum for last made move, used to check for T-Spins
enum successful_move {
    none = -1,
    left_right = 0,
    soft_drop = 1,
    hard_drop = 2,
    rotation = 3,
    kick = 4,
	shift = 5,
}

// Enum for the type of T-Spin, used to determine points
enum tspin_check {
	none = -1,
	tspin = 0,
	mini = 1,
}

// Enum for type of callout, to handle each group individually
enum callout_type {
	line = 0,
	combo = 1,
	points = 2,
}