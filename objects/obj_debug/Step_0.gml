// Esse objeto serve simplemente para debug ingame.

if active {
	
	// Room debug.
	if room == rm_floresta_andar_1 {
		if room_debug != rm_floresta_andar_1 {
			room_goto(room_debug);
		}
	}
	
	// Noclip.
	if keyboard_check_pressed(ord("N")) {
		noclip = !noclip;
	}
	
	if noclip {
		if instance_exists(obj_personagem) {
			obj_personagem.mask_index = -1;
		}
	} else {
		if instance_exists(obj_personagem) {
			obj_personagem.mask_index = obj_personagem.sprite_index;
		}
	}
	
	// Matar inimigos.
	if keyboard_check_pressed(ord("K")) {
		if instance_number(obj_inimigo) > 0 {
			instance_destroy(obj_inimigo);
		}
	}
}
