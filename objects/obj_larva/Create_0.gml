/// @description
randomize();

// Estado
estado = scr_inimigo_escolha;
proximo_estado = 0;
dist_aggro = 80;
invulneravel = false;
perseguindo = false;
combate = false;

// Movimento
direcao = 0;
kb_speed = 0;

veloc_perseguir = 1;
veloc = 0.3;
hveloc = 0;
vveloc = 0;
veloc_dir = 0;

// Stats
max_hp = 15;
hp = max_hp;
defesa = 0;
dano = 8;
kb = 3;
drop = -1;
xp = 6;

// Drop.
id_drop = -1;
chance_drop = -1;
quantidade = -1;

// Desenho.
sprite_andando = spr_larva_andando;
sprite_parado = spr_larva_parada;
sprite_atacando = spr_larva_atacando;
y_sombra = 6;

// Combate
index_ataque = 5;
projetil = obj_gosma;
projetil_atirado = false;

som_hit = snd_wormhit;

#region Timers e duração.
duracao_estado = 180; // Representa a duração média de cada estado.
alarme_estado = 0;
hit_alarme = 0;
hit_duracao = 10;
invulneravel_alarme = 0;
invulneravel_duracao = 60; // 1 segundos.
alarme_barra_vida = 0;
duracao_barra_vida = 180; // 3 segundos.
#endregion
