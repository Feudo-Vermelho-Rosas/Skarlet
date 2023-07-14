// Sistema de pause.
if global.pause {
	exit;
}

var _abrir = keyboard_check_pressed(ord("Z"));

// Distância de ativação.
if distance_to_point(obj_personagem.x,obj_personagem.y) < distancia_ativar {
		
	// Ativar o diálogo.	
	if _abrir {
		var _inst = instance_create_depth(0,0,-5000,obj_dialogo);
		if placa_de_report {
			var _num_enemies = instance_number(obj_inimigo)
			var _num_eliminar = _num_enemies-5;
			if (_num_eliminar < 0) _num_eliminar = 0;
			_inst._string = "Elimine os inimigos para prosseguir!\n\n\nFaltando: " +
							string(_num_eliminar);
		} else {
			_inst._string = dialogo;
		}
	}
}