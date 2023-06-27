/// Abrir o báu
if distance_to_object(obj_personagem) < distancia_ativar {
	if instance_exists(obj_shop){
		var _inst = instance_nearest(x, y, obj_shop);
		if keyboard_check_pressed(ord("Z")) && global.money >= price{
			ds_grid_add_item(_inst.image_index, _inst.quantidade, _inst.sprite_index);
			instance_destroy();
			global.money -= price;
		}
	}
}