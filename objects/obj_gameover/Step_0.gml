// Reinicie o jogo se o timer chegar a 0;
if timer_gameover <= 0 {
	if keyboard_check_pressed(ord("Z")) {
		game_restart();
	}
} else {
	timer_gameover -= 1;
}