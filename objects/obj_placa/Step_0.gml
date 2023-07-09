// Sistema de pause.
if global.pause {
	exit;
}

var _abrir = keyboard_check_pressed(ord("Z")) or mouse_check_button_pressed(mb_right);

// Distância de ativação.
if distance_to_object(obj_personagem) < distancia_ativar {
		
	// Ativar o diálogo.	
	if _abrir {
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