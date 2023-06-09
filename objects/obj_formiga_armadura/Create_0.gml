/// @description

// Estado
estado = scr_inimigo_escolha;
proximo_estado = 0;
perseguindo = false;
dist_aggro = 80;
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
max_hp = 15;
hp = max_hp;
defesa = 2;
dano = 8;
kb = 2;
drop = -1;
xp = 10;

// Desenho.
sprite_andando = spr_formiga_armadura_andando;
sprite_parado = spr_formiga_armadura_parada;
sprite_perseguindo = spr_formiga_armadura_andando;
y_sombra = 8;

som_hit = snd_anthit;

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