/// @description Inimigo cobra.

// Inherit the parent event
event_inherited();

// Stats
max_hp = 35;
hp = max_hp;
defesa = 3;
dano = 20;
kb = 3;
drop = -1;
xp = 18;
reward = 3;

// Drop.
id_drop = -1;
chance_drop = -1;
quantidade = -1;

// Desenho.
sprite_andando = spr_cobra_andando;
sprite_parado = spr_cobra_parada;
sprite_perseguindo = spr_cobra_atacando;
y_sombra = 6;

som_hit = snd_cobrahit;