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
	
	if keyboard_check_pressed(ord("P")) {
		instance_create_layer(0,0,"Instances",obj_tijolo);
	}
}
