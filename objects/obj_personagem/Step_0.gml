/// @description

if (global.pause) {
	image_speed = 0
	exit;
}
image_speed = 1;

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_personagem_hit;
}

// Execute o estado atual do personagem.
script_execute(estado);

// Pegar um item.
if instance_exists(obj_item) and obj_inventario.inventario == false{
	var _inst = instance_nearest(x, y, obj_item);
	if distance_to_point(_inst.x, _inst.y) <= 20 {
		if keyboard_check_pressed(ord("F")){
			ds_grid_add_item(_inst.image_index, _inst.quantidade, _inst.sprite_index);
			
			instance_destroy(_inst);
		}
	}
}