/// @description Modelo padrão boss

// Estado.
estado = scr_boss_criacao;
proximo_estado = -1;
rage = false;
repeticao_rush = 0;

alpha_add = 0;

// Movimento.
veloc_avanco = 4;
veloc = 2;
vveloc = 0;
hveloc = 0;
veloc_dir = 0;
direcao = 0;

dest_x = 0;
dest_y = 0;

tempo = 0;

#region Alarmes e timers.
duracao_spawn = 120 // 2 segundos.
alarme_spawn = duracao_spawn;
duracao_ferroes = 240 // 4 segundos.
alarme_ferroes = duracao_ferroes;
duracao_abelhas = 240 // 4 segundos.
alarme_abelhas = duracao_abelhas;
duracao_cooldown = 120 // 2 segundos.
alarme_cooldown = duracao_cooldown;
#endregion
