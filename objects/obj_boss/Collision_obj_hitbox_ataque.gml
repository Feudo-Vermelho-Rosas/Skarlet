// Tome hit se não estiver invulnerável.
if !invulneravel {
	
	// Som de hit
	audio_play_sound(snd_hit_boss,10,false);
	
	var _personagem = obj_personagem;
	var _dano = scr_calcular_dano_1(_personagem.dano);
	
	// Mude as stats.
	hp -= _dano;
	invulneravel = true;
	
	// Set os alarmes.
	alarme_hit = duracao_hit;
	invulneravel_alarme = invulneravel_duracao;
	
	// Crie o indicador de dano.
	var _indicador = instance_create_layer(x,y,"Instances",obj_indicador_dano);
	_indicador.x1 = x;
	_indicador.y1 = y;
	_indicador.dano = _dano;
	
}
