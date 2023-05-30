/// @description Modelo padrão boss

// Estado.
estado = scr_boss_criacao;
proximo_estado = -1;
rage = false;
repeticao_rush = 0;
invulneravel = false;
qntd_spawn_abelhas = 3;

alpha_add = 0;

// Movimento.
veloc_avanco = 6;
veloc = 2;
vveloc = 0;
hveloc = 0;
veloc_dir = 0;
direcao = 0;

dest_x = 0;
dest_y = 0;

tempo = 0;

// Stats
max_hp = 200;
hp = 200;
defesa = 10;
dano = 12;
kb = 3;

// Desenho
sprite_avancando = spr_boss_abelha_avanco;
sprite_parado = spr_boss_abelha_parada;

#region Alarmes e timers.
duracao_spawn = 120 // 2 segundos.
alarme_spawn = duracao_spawn;
duracao_ferroes = 480 // 4 segundos.
alarme_ferroes = duracao_ferroes;
duracao_abelhas = 240 // 4 segundos.
alarme_abelhas = duracao_abelhas;
duracao_cooldown = 120 // 2 segundos.
alarme_cooldown = duracao_cooldown;
duracao_hit = 30 // 0.5 segundo.
alarme_hit = 0;
invulneravel_duracao = 240; // 4 segundos.
invulneravel_alarme = invulneravel_duracao;
duracao_spawn_ferroes = 30; // 0.5 segundo.
alarme_spawn_ferroes = duracao_spawn_ferroes;
#endregion
