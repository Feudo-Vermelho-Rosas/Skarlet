// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	var _personagem = obj_personagem;
	var _dano = scr_calcular_dano_1(_personagem.dano);
	var _kb = _personagem.kb;
	
	// Mude as stats.
	hp -= _dano;
	kb_speed = _kb;
	invulneravel = true;
	veloc_dir = point_direction(x,y,_personagem.x,_personagem.y)-180;
	
	// Set os alarmes.
	hit_alarme = hit_duracao;
	invulneravel_alarme = invulneravel_duracao;
	alarme_barra_vida = duracao_barra_vida;
	
	// Crie o indicador de dano.
	var _indicador = instance_create_layer(x,y,"Instances",obj_indicador_dano);
	_indicador.x1 = x;
	_indicador.y1 = y;
	_indicador.dano = _dano;
	
	// Som de hit.
	audio_play_sound(som_hit,100,false);
	
}
