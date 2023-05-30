 /// @description

// Checar a distância do personagem.
combate = scr_checar_personagem();
if combate {
	estado = scr_inimigo_projetil_combate;
}

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_inimigo_hit;
}

// Executar o estado atual.
script_execute(estado);

// Delete a instância se o HP chegar a 0.
if hp <= 0 {
	// Crie o efeito de partícula.
	instance_create_layer(x,y,"Instances",obj_particula_morte);
	
	instance_destroy();
}
