if distance_to_point(obj_personagem.x,obj_personagem.y) < distancia_ativar {
	if keyboard_check_pressed(ord("Z")) {
		// Abra a porta.
		if sprite_index == spr_porta_fechada {
			sprite_index = spr_porta_aberta;
			audio_play_sound(snd_abrir_bau,100,false);
		}
	}
}


