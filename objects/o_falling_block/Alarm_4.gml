/// @description Update Score
ScoreAdder();
// Destroy all particle emitters
part_emitter_destroy_all(global.par_sys);
// Spawn new block
with o_spawner alarm_set(1, 5);
// Reset Hold Available flag
global.hold_available = true;
// Destroy block
instance_destroy();