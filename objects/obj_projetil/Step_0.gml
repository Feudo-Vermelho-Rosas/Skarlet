/// @description

image_alpha -= 1/vida_tempo;

x += hveloc;
y += vveloc;

if image_alpha <= 0 {
	instance_destroy();
}
