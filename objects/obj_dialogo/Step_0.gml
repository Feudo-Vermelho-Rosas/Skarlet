var _fechar = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_escape)
			  or mouse_check_button_pressed(mb_right);

// Feche o diálogo.
if _fechar {
	global.pause = false;
	instance_destroy();
}
