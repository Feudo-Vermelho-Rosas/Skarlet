// Esse objeto serve simplemente para debug ingame.

// Mude para room inicial
if room == rm_floresta_andar_1 {
	room_goto(rm_floresta_andar_boss);
}

// Mate todos os inimigos numa sala.
if keyboard_check_pressed(ord("K")) {
	if instance_number(obj_inimigo) > 0 {
		instance_destroy(obj_inimigo);
	}
}
