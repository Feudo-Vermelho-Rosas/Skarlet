/// @description

// Checar a distância do personagem.
scr_checar_personagem();

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_inimigo_hit;
}

// Executar o estado atual.
script_execute(estado);

// Delete a instância se o HP chegar a 0.
if hp <= 0 {
	instance_destroy();
}