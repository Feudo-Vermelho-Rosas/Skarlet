// Abrir o baú.
if distance_to_object(obj_personagem) < distancia_ativar {
	if keyboard_check_pressed(ord("Z")){
		image_index = 1;
		instance_destroy(obj_bau_mimico_parado);
		
		// Spawn de Mimico.
		var _drop = instance_create_layer(x,y+10,"Instances",obj_mimico);
	}
}