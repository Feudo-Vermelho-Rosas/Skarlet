if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

// Controle de direção.
if veloc_dir > 90 and veloc_dir < 270 {
	image_xscale = -0.5;
} else {
	image_xscale = 0.5;
}

image_alpha -= 1/vida_tempo;

hveloc = lengthdir_x(veloc, veloc_dir);
vveloc = lengthdir_y(veloc, veloc_dir);

x += hveloc;
y += vveloc;

if image_alpha <= 0 {
	instance_destroy();
}
