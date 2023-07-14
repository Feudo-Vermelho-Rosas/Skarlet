/// @description Inimigo abelha do boss.

// Inherit the parent event
event_inherited();

// Estado
dist_aggro = 4000;

// Stats
max_hp = 12;
hp = max_hp;
defesa = 0;
dano = 5;
kb = 3;
xp = 1;
reward = 0;

// Drop.
id_drop = Itens.PocaoRegen;
chance_drop = 0.05;
quantidade = 1;

// Desenho.
sprite_andando = spr_abelha_normal;
sprite_parado = spr_abelha_normal;
sprite_perseguindo = spr_abelha_perseguindo;
y_sombra = 8;

som_hit = snd_beehit;
