// Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	// Mude as stats.
	var _dano = scr_calcular_dano_2(other.dano);
	var _kb = other.kb;
	
	hp -= _dano;
	kb_speed = _kb;
	invulneravel = true;
	veloc_dir = point_direction(x,y,other.x,other.y)-180;
	
	// Set os alarmes.
	hit_alarme = hit_duracao;
	invulneravel_alarme = invulneravel_duracao;
	
	// Som de hit.
	audio_play_sound(snd_hit_jogador,100,false);
	
}
