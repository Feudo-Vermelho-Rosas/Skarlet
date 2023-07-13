if !audio_is_playing(global.musica_bg) {
	audio_stop_all();
	audio_play_sound(global.musica_bg,1000,true,1);
	audio_group_set_gain(audiogroup_music, 0, 0);
	audio_group_set_gain(audiogroup_music, global.volume_musica, 5000);
}