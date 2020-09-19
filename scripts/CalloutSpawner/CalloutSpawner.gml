/// @func CalloutSpawner(callout)
/// @desc Spawns callouts where applicable
/// @arg {String} the text of the callout
function CalloutSpawner(output){
	var base_x = board_id.callouts_base_pos[0];
	var base_y = board_id.callouts_base_pos[1];
	
	// Callout Combo
	var comboCC = noone;
	with o_callout {
		if type == callout_type.combo 
			comboCC = id;
	}
	if board_id.combo > 0 {
		if comboCC == noone {
			with instance_create_layer(base_x, base_y, "Instances", o_callout) {
				comboCC = id;
				board_id = other.board_id;
				type = callout_type.combo;
				maxSize = 1.2;
				fadeDelay = 2;
				fadeType = 1;
				font = statFont;
				event_user(0);
			}
		}
		comboCC.size = 1;
		comboCC.fade = 1;
		comboCC.callout = "Combo: " + string(board_id.combo);
		comboCC.alarm[0] = 1;
		base_y += comboCC.sprite_height;
	}
	else if board_id.combo == -1 and comboCC != noone {
		comboCC.alarm[comboCC.fadeType] = 1;
	}
	// Callout Line Clear Type
	if string_length(output) > 0 {
		if global.show_callouts == callouts.some {
			switch output {
				case "Single": case "Double": case "Triple": exit; break;
				default: break;
			}
		}
		with instance_create_layer(base_x, base_y, "Instances", o_callout) {
			board_id = other.board_id;
			type = callout_type.line;
			if output == "ALL CLEAR" {
				textColour = c_fuchsia;
				fadeType = 2;
				maxSize = 1.4;
			}
			callout = output;
			event_user(0);
			alarm[0] = 1;
		}
	}
}