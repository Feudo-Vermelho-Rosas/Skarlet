// Esse objeto serve simplemente para debug ingame.

if active {
	
	// Room debug.
	if room == rm_floresta_andar_1 {
		if room_debug != rm_floresta_andar_1 {
			room_goto(room_debug);
		}
	}
	
	// Matar inimigos.
	if keyboard_check_pressed(ord("K")) {
		if instance_number(obj_inimigo) > 0 {
			for (var i = 0; i < instance_number(obj_inimigo); i++) {
				var _inst = instance_find(obj_inimigo,i);
				_inst.hp = 0;
			}
		}
		if instance_number(obj_boss) > 0 {
			for (var i = 0; i < instance_number(obj_boss); i++) {
				var _inst = instance_find(obj_boss,i);
				_inst.hp = 0;
			}
		}
	}
	
	// Mudar o level do personagem.
	if keyboard_check_pressed(ord("L")) {
		obj_personagem.level = 4;
		with (obj_personagem) {
			script_execute(scr_levelup);
		}
		obj_personagem.xp = 0;
	}
	
	// Ir pra próxima room.
	if keyboard_check_pressed(ord("R")) {
		room_goto_next();
	}
}
