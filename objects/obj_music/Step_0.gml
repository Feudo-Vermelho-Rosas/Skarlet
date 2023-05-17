// Ajuste o volume da música de acordo com o volume geral.
audio_group_set_gain(audiogroup_default, global.volume_geral, 0);
audio_group_set_gain(audiogroup_music, global.volume_geral*global.volume_musica, 0);