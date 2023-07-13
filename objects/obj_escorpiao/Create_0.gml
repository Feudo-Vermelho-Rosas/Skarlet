/// @description Inimigo escorpião.

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
id_drop = -1;
chance_drop = -1;
quantidade = -1;

// Desenho.
sprite_andando = spr_escorpiao_parado;
sprite_parado = spr_escorpiao_parado;
sprite_perseguindo = spr_escorpiao_andando;
y_sombra = 6;
