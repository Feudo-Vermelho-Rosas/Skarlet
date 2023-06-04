 // Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

image_speed = 1;

// Cheque o alarme de hit.
if alarme_hit > 0 {
	estado = scr_boss_abelha_hit;
}

// Execute o estado atual.
script_execute(estado);

// Sempre controle a direção.
scr_boss_abelha_controle_sprite();

// Cheque o HP.
if hp < max_hp/3 and rage == false {
	
	// Modo de rage.
	rage = true;
	sprite_avancando = spr_boss_abelha_rage_avanco;
	sprite_parado = spr_boss_abelha_rage_parada;
	
	veloc_avanco *= 1.5;
	veloc *= 2;
	
	qntd_spawn_abelhas = 5;
	
	duracao_cooldown /= 2;
	duracao_ferroes /= 2;
	duracao_spawn_ferroes /= 2;
	
} else if hp <= 0 { // Delete a instância se o HP chegar a 0.
	// Adicione o xp ao jogador.
	obj_personagem.xp += xp;
	
	audio_sound_gain(global.musica_bg,0,2000);
	
	// Crie as partículas.
	repeat(30) {
		var _x = x + irandom_range(-30, 30);
		var _y = y + irandom_range(-25, 5);
		instance_create_layer(_x,_y,"Instances",obj_particula_morte);
	}
	
	instance_destroy();
	
}