/// @description Update Score

script_execute(ScoreAdder);

part_emitter_destroy_all(global.par_sys);
// Spawn new block
with o_spawner alarm_set(1, 5);
global.hold_available = true;
instance_destroy();