// Sistema de pause.
if global.pause {
	image_speed = 0;
	exit;
}

x += hveloc;
y += vveloc;

vveloc += acel;

if alarme_vida <= 0 {
	instance_destroy();
}
alarme_vida -= 1;
