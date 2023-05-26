/// @description Partícula de morte.

ParticulaMorte = part_system_create();
part_system_depth(ParticulaMorte, depth);

particula = part_type_create();
part_type_shape(particula, pt_shape_square);
part_type_size(particula,0.01,0.02,0,0);
part_type_color1(particula, c_white);
part_type_alpha2(particula, 1, -0.10);
part_type_speed(particula,0.1,0.3,0,0)
part_type_direction(particula,90,0,0,0);
part_type_gravity(particula,0.02,90);
part_type_life(particula,30,30);

emitor = part_emitter_create(ParticulaMorte);
part_emitter_region(ParticulaMorte, emitor, x-7, x+7, y-7, y+7,
					ps_shape_ellipse, ps_distr_gaussian);
