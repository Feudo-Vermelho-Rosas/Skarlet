var _abrir = keyboard_check_pressed(ord("E"));

// O inventário só pode ser aberto quando o jogo não estiver pausado,
// e só pode ser fechado quando se o mesmo estiver aberto.
if (_abrir and global.pause == false) or (_abrir and inventario == true){
	inventario = !inventario;
	global.pause = !global.pause 
	// Som de abrir ou fechar inventário.
	audio_play_sound(snd_abririnv,100,false);
}

// Alarmes.
if !global.pause {
	// Faça o controle de alarmes das poções.
	if alarme_cura_delay > 0 {
		alarme_cura_delay -= 1;
	}
	
	if alarme_forca_duracao > 0 {
		alarme_forca_duracao -= 1;
	} else {
		obj_personagem.dano_pocao = 0;
	}
	
	if alarme_defesa_duracao > 0 {
		alarme_defesa_duracao -= 1;
	} else {
		obj_personagem.defesa_pocao = 0;
	}
	
	if alarme_velocidade_duracao > 0 {
		alarme_velocidade_duracao -= 1;
	} else {
		obj_personagem.veloc_pocao = 0;
	}
}