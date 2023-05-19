/// @description

if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

image_alpha -= 1/vida_tempo;

x += hveloc;
y += vveloc;

if image_alpha <= 0 {
	instance_destroy();
}
