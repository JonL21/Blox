/// @description Initialize surfaces if lost

if !surface_exists(surf)
	surf = surface_create(room_width, room_height);

if !surface_exists(surf2)
	surf2 = surface_create(room_width, room_height);