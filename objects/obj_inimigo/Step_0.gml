// Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

image_speed = 1;

// Checar a distância do personagem.
perseguindo = scr_checar_personagem();
if perseguindo {
	estado = scr_inimigo_perseguindo;
}

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_inimigo_hit;
}

// Executar o estado atual.
script_execute(estado);

// Sempre controle a direção.
script_execute(controle_direcao);

// Delete a instância se o HP chegar a 0.
if hp <= 0 {
	instance_destroy();
}