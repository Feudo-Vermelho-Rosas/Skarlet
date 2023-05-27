// Esse objeto serve simplemente para debug ingame.

// Mate todos os inimigos numa sala.
if keyboard_check_pressed(ord("K")) {
	if instance_number(obj_inimigo) > 0 {
		instance_destroy(obj_inimigo);
	}
}
