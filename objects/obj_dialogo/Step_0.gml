var _fechar = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("Z"));

// Feche o diálogo.
if _fechar {
	global.pause = false;
	instance_destroy();
}
