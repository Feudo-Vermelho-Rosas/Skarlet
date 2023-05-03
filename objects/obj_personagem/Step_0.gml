/// @description

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_personagem_hit;
}

// Execute o estado atual do personagem.
script_execute(estado);
