// Pegar um item.
if obj_inventario.inventario == false{
	if distance_to_point(obj_personagem.x,obj_personagem.y) <= distancia_item {
		if keyboard_check_pressed(ord("F")){
			obj_inventario.add_item(image_index, quantidade, spr_items_armas);
			instance_destroy();
		}
	}
}


