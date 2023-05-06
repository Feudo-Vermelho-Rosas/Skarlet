/// @description

// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	var _personagem = obj_personagem;
	
	// Mude as stats.
	hp -= _personagem.dano;
	kb_speed = _personagem.kb;
	invulneravel = true;
	veloc_dir = point_direction(x,y,_personagem.x,_personagem.y)-180;
	
	// Set os alarmes.
	hit_alarme = hit_duracao;
	invulneravel_alarme = invulneravel_duracao;
	
}
