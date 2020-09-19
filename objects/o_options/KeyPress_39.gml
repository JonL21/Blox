/// @description Change Preferences

switch menu_select {
	case 0: changeShiftDelay() break;
	case 1: changeRepeatRate() break;
	case 2: changeDropFactor() break;
	case 3: changeParticleEffects() break;
	case 4: changeCalloutsDisplay() break;
	default: break;
}
audio_play_sound(snd_right, 1, false);