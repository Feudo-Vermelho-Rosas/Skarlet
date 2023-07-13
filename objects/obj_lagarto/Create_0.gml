/// @description Inimigo lagarto.

// Inherit the parent event
event_inherited();

// Stats
max_hp = 30;
hp = max_hp;
defesa = 3;
dano = 15;
kb = 3;
drop = -1;
xp = 14;
reward = 2;

// Drop.
id_drop = Itens.PocaoVelocidade;
chance_drop = 0.10;
quantidade = 1;

// Desenho.
sprite_andando = spr_lagarto_andando;
sprite_parado = spr_lagarto_parado;
sprite_perseguindo = spr_lagarto_atacando;
y_sombra = 6;

som_hit = snd_lagarto_hit;
