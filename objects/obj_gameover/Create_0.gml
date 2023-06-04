/// @description Efeito de gameover.

audio_sound_gain(global.musica_bg,0,1000);
audio_play_sound(snd_game_over,100,false);

alpha = 0;
alpha_add = 1/60;
timer_gameover = 180;
alpha_mensagem = 0;

y1_retangulo = 0;
y2_retangulo = display_get_gui_height();

escala = 1;
escala_add = 1/600;
