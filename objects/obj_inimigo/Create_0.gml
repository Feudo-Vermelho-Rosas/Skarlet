/// @description Inimigo base

// Estado
estado = scr_inimigo_escolha;
proximo_estado = 0;
perseguindo = false;
dist_perseguir = 80;
invulneravel = false;

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
sprite_andando = 0;
sprite_parado = 0;

#region Timers e du ração.
duracao_estado = 180; // Representa a duração média de cada estado.
alarme_estado = 0;
hit_alarme = 0;
hit_duracao = 10;
invulneravel_alarme = 0;
invulneravel_duracao = 60; // 1 segundos.
alarme_barra_vida = 0;
duracao_barra_vida = 180; // 3 segundos.
#endregion