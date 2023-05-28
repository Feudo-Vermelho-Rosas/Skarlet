///Se apertar o "ESC" o jogo pausa
if (keyboard_check_pressed(vk_escape)) {
	global.pause = !global.pause;
	
	// Crie uma instância do menu de pause caso uma já não exista.
	if !instance_exists(obj_menupause) {
		instance_create_depth(0,0,-1,obj_menupause);
	} 
}