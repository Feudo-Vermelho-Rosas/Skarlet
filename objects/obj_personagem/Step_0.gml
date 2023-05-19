/// @description

if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_personagem_hit;
}

// Execute o estado atual do personagem.
script_execute(estado);
