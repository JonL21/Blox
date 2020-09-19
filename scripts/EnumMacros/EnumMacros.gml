
#macro DEFAULT_LEFT vk_left
#macro DEFAULT_RIGHT vk_right
#macro DEFAULT_SOFT_DROP vk_down
#macro DEFAULT_HARD_DROP vk_space
#macro DEFAULT_HOLD vk_shift
#macro DEFAULT_ROTATE_LEFT ord("Z")
#macro DEFAULT_ROTATE_RIGHT ord("X")

//#macro DEFAULT_LOCK_DELAY 30
//#macro DEFAULT_CANCELS 15
#macro DEFAULT_SHIFT_DELAY 10
#macro DEFAULT_REPEAT_DELAY 2
#macro DEFAULT_DROP_FACTOR 40
#macro DEFAULT_SHOW_PARTICLES 1
#macro DEFAULT_SHOW_CALLOUTS callouts.some
//#macro DEFAULT_CLEAR_DELAY 8

// Enum for block sprites
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
	zen = 3,
	master = 4,
}

// Enum for last made move, used to check for T-Spins
enum successful_move {
	none = -1,
	left_right = 0,
	soft_drop = 1,
	rotation = 2,
	kick = 3,
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
	level_up = 2,
}

// Enum for which callouts to show
enum callouts {
	none = -1,
	some = 0, // B2Bs, T-Spins, and Quadruples only
	every = 1
}