// Abrir o baú.
if distance_to_object(obj_personagem) < distancia_ativar {
	if keyboard_check_pressed(ord("Z")){
		image_index = 1;
		audio_play_sound(snd_abrir_bau,100,false);
		
		// Spawn de Mimico.
		var _inst = instance_create_layer(x,y,"Instances",obj_mimico);
		
		instance_destroy(obj_bau_mimico);
	}
}