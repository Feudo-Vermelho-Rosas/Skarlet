// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	var _dano = scr_calcular_dano_2(other.dano);
	var _kb = other.kb;
	
	// Mude as stats.
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
