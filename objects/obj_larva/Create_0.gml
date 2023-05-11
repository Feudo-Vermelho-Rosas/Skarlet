/// @description

// Estado
estado = scr_inimigo_escolha;
proximo_estado = 0;
dist_aggro = 80;
invulneravel = false;
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
max_hp = 20;
hp = 20;
defesa = 0;
dano = 5;
kb = 3;

// Desenho.
sprite_andando = spr_larva_andando;
sprite_parado = spr_larva_parada;
sprite_atacando = spr_larva_atacando;

// Combate
index_ataque = 5;
projetil = obj_gosma;

#region Timers e duração.
duracao_estado = 180; // Representa a duração média de cada estado.
alarme_estado = 0;
hit_alarme = 0;
hit_duracao = 10;
invulneravel_alarme = 0;
invulneravel_duracao = 60; // 1 segundos.
#endregion
