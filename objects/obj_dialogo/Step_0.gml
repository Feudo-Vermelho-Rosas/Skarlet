var _fechar = keyboard_check_pressed(vk_escape);

// Feche o diálogo.
if _fechar {
	global.pause = false;
	instance_destroy();
}
