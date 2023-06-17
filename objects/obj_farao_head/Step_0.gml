if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

// Controle de direção.
if veloc_dir > 90 and veloc_dir < 270 {
	image_xscale = -1;
} else {
	image_xscale = 1;
}

hveloc = lengthdir_x(veloc, veloc_dir);
vveloc = lengthdir_y(veloc, veloc_dir);

x += hveloc;
y += vveloc;

vida_tempo -= 1;
if vida_tempo <= 0 {
	instance_destroy();
}