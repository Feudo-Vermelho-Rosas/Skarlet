// Carregue os grupos de áudio.
audio_group_load(audiogroup_default);
audio_group_load(audiogroup_music);

// Volumes.
global.volume_geral = 5;
global.volume_musica = 5;
volume_geral = global.volume_geral/10;
volume_musica = global.volume_musica/10;

// Variável global da música de background.
global.musica_bg = -1;