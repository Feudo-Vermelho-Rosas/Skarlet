if distance_to_point(obj_personagem.x,obj_personagem.y) < distancia_ativar {
	if keyboard_check_pressed(ord("C")) and global.money >= price{
		// Comprar o item.
		obj_inventario.add_item(image_index, quantidade, spr_items_armas);
		global.money -= price;
		audio_play_sound(snd_loja,100,false);
		instance_destroy();
	}
}