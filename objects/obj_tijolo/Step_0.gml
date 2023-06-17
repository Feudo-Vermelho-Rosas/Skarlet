if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;
mask_index = noone;

vveloc += acel;
y += vveloc;
y_percorrido += vveloc;

// Habilite a hitbox novamente.
if y_percorrido >= y_queda-10 {
	mask_index = spr_tijolo;
}

if y_percorrido >= y_queda {
	instance_destroy();
}
