// Ajuste o volume da música de acordo com o volume geral.
volume_geral = global.volume_geral/10;
volume_musica = global.volume_musica/10;

audio_group_set_gain(audiogroup_default, volume_geral, 1);
audio_group_set_gain(audiogroup_music, volume_musica, 1);