///Se apertar o "ESC" o jogo pausa

var _esc = keyboard_check_pressed(vk_escape);
var _gameover = instance_exists(obj_gameover);

if instance_exists(obj_inventario) {
	var _inventario = obj_inventario.inventario;
} else {
	var _inventario = false;
}

if _esc and !_inventario and !_gameover {
	global.pause = !global.pause;
	
	// Crie uma instância do menu de pause caso uma já não exista.
	if !instance_exists(obj_menupause) {
		instance_create_depth(0,0,-1,obj_menupause);
	}
}