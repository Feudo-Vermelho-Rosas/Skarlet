// Sistema de pause.
if global.pause {
	exit;
}

// Ativar o diálogo.
if distance_to_object(obj_personagem) < distancia_ativar {
	if keyboard_check_pressed(ord("Z")) {
		var _inst = instance_create_depth(0,0,-5000,obj_dialogo);
		if placa_de_report {
			var _num_enemies = instance_number(obj_inimigo)
			_inst._string = "Derrote todos os inimigos para prosseguir!\n\nFaltando: " +
							string(_num_enemies);
		} else {
			_inst._string = dialogo;
		}
	}
}