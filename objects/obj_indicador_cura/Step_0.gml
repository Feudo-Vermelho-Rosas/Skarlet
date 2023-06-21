// Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

// Efeito ao ser criado
y1 += -0.25;
alpha -= 0.02;

if alpha <= 0 {
	instance_destroy();
}
