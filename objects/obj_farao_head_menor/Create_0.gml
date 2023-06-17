/// @description Projétil menor do boss faraó.
event_inherited();

// Movimento.
veloc = 3;
if veloc_dir > 90 and veloc_dir < 270 {
	image_xscale = -0.5;
} else {
	image_xscale = 0.5;
}

// Desenho.
image_yscale = 0.5;

// Alarmes.
vida_tempo = 60; // 1 segundos.