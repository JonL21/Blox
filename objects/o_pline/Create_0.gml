s = part_system_create();

p0= part_type_create();
part_type_shape(p0, pt_shape_line);
part_type_scale(p0, 6, 3.5);
part_type_life(p0, 12, 12);


p1 = part_type_create();
part_type_shape(p1, pt_shape_line);
part_type_scale(p1, 7, 4);
part_type_alpha2(p1, 1, 0);
part_type_speed(p1, 1, 50, 2, 0);

part_type_death(p0, 1, p1);

e = part_emitter_create(s);

alarm[0] = 1;


