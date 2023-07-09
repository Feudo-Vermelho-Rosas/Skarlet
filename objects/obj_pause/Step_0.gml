///Se apertar o "ESC" o jogo pausa

var _esc = keyboard_check_pressed(vk_escape);
var _gameover = instance_exists(obj_gameover);
var _diagolo = instance_exists(obj_dialogo);
var _inventario;

if instance_exists(obj_inventario) {
	_inventario = obj_inventario.inventario;
} else {
	_inventario = false;
}

// Abrir menu de pause.
if _esc and !_inventario and !_gameover and !_diagolo {
	global.pause = !global.pause;
	
	// Crie uma instância do menu de pause caso uma já não exista.
	if !instance_exists(obj_menupause) {
		instance_create_depth(0,0,-1,obj_menupause);
	}
}