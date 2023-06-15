/// @description Boss abelha.

// Inherit the parent event
event_inherited();

// Estado.
escolha = scr_abelha_escolha;
repeticao_rush = 0;
qntd_spawn_abelhas = 3;
controle_direcao = scr_boss_abelha_controle_sprite;
controle_hp = scr_boss_controle_hp;
hit = scr_boss_abelha_hit;

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

// Drops.
id_drop_1 = 4;
id_drop_2 = choose(8,10);
id_drop_3 = 5
quantidade_1 = irandom_range(3,5);
quantidade_2 = 1;
quantidade_3 = 1;

// Desenho
sprite_avancando = spr_boss_abelha_avanco;
sprite_parado = spr_boss_abelha_parada;

#region Alarmes e timers.
duracao_ferroes = 480 // 4 segundos.
alarme_ferroes = duracao_ferroes;
duracao_abelhas = 240 // 4 segundos.
alarme_abelhas = duracao_abelhas;
duracao_spawn_ferroes = 30; // 0.5 segundo.
alarme_spawn_ferroes = duracao_spawn_ferroes;
#endregion