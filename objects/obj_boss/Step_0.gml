 // Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

image_speed = 1;

// Cheque o alarme de hit.
if alarme_hit > 0 {
	estado = hit;
}

// Execute o estado atual.
script_execute(estado);

// Sempre controle a direção.
script_execute(controle_direcao);

// Controle o hp.
script_execute(controle_hp);