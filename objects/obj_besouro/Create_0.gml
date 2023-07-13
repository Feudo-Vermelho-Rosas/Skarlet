/// @description Inimigo besouro.

// Inherit the parent event
event_inherited();

// Stats
max_hp = 25;
hp = max_hp;
defesa = 3;
dano = 15;
kb = 3;
drop = -1;
xp = 14;
reward = 2;

// Drop.
id_drop = -1;
chance_drop = -1;
quantidade = -1;

// Desenho.
sprite_andando = spr_besouro_voando;
sprite_parado = spr_besouro_parado;
sprite_perseguindo = spr_besouro_atacando;
y_sombra = 8;

som_hit = snd_besouro_hit;
