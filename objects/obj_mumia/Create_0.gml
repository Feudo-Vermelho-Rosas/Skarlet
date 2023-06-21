/// @description Inimigo múmia.

// Inherit the parent event
event_inherited();

// Estado.
controle_direcao = scr_controlar_direcao_4_lados;

// Movimento.
veloc = 0.3;

// Stats
max_hp = 40;
hp = 40;
defesa = 10;
dano = 24;
kb = 3;
xp = 5;

// Drop.
id_drop = -1;
chance_drop = -1;
quantidade = -1;

// Desenho.
sprite_parado_lado = spr_mumia_parada_lado;
sprite_parado_frente = spr_mumia_parada_frente;
sprite_parado_costas = spr_mumia_andando_costas;
sprite_andando_lado = spr_mumia_andando_lado;
sprite_andando_frente = spr_mumia_andando_frente;
sprite_andando_costas = spr_mumia_andando_costas;
sprite_perseguindo_lado = spr_mumia_andando_lado;
sprite_perseguindo_frente = spr_mumia_andando_frente;
sprite_perseguindo_costas = spr_mumia_andando_costas;

y_sombra = 8; 