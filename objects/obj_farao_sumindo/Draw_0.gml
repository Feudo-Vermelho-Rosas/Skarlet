image_alpha -= alpha_add;

if image_alpha <= 0 {
	instance_destroy();
}

draw_self();