// Abrir o baú.
if distance_to_object(obj_personagem) < distancia_ativar {
	if keyboard_check_pressed(ord("Z")) and !looteado {
		image_index = 1;
		
		// Drop.
		var _drop = instance_create_layer(x,y+10,"Instances",obj_item);
		_drop.sprite_index = spr_items_armas;
		_drop.image_index = id_drop;
		_drop.quantidade = quantidade;
		
		looteado = true;
	}
}