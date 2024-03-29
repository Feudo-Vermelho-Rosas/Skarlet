/// @description Inimigo mimico

//inherit the parent event
event_inherited();

//Estado
controle_direcao = scr_controlar_direcao_4_lados;

//Movimento
veloc = 0.2;

//Stats
max_hp = 50;
hp = max_hp;
defesa = 4;
dano = 25;
kb = 3;
xp = 30;

//Drop
id_drop = -1;
chance_drop = -1;
quantidade = -1;

//Desenho
sprite_parado_lado = spr_mimico_andando_lado;
sprite_parado_frente = spr_mimico_frente;
sprite_parado_costas = spr_mimico_costa;
sprite_andando_lado = spr_mimico_andando_lado;
sprite_andando_frente = spr_mimico_frente;
sprite_andando_costas = spr_mimico_costa;
sprite_perseguindo_lado = spr_mimico_andando_lado;
sprite_perseguindo_frente = spr_mimico_frente;
sprite_perseguindo_costas = spr_mimico_costa;

som_hit = snd_mimico_hit;

//Sombra
y_sombra = 8;