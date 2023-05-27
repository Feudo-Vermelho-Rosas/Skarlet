// Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

image_angle = direcao - 45;

x += hveloc;
y += vveloc;

if vida_tempo <= 0 {
	instance_destroy();
} else {
	vida_tempo -= 1;
}
