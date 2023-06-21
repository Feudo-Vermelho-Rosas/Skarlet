var _abrir = keyboard_check_pressed(ord("E"));

// O inventário só pode ser aberto quando o jogo não estiver pausado,
// e só pode ser fechado quando se o mesmo estiver aberto.
if (_abrir and global.pause == false) or (_abrir and inventario == true){
	inventario = !inventario;
	global.pause = !global.pause 
	// Som de abrir ou fechar inventário.
	audio_play_sound(snd_abririnv,100,false);
}

// Alarmes.
if !global.pause {
	if alarme_cura_delay > 0 {
		alarme_cura_delay -= 1;
	}
}