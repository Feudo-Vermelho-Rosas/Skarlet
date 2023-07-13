/// @description Inimigo abelha

// Inherit the parent event
event_inherited();

// Stats
max_hp = 15;
hp = max_hp;
defesa = 0;
dano = 10;
kb = 3;
xp = 6;
reward = 1;

// Desenho.
sprite_andando = spr_abelha_normal;
sprite_parado = spr_abelha_normal;
sprite_perseguindo = spr_abelha_perseguindo;
y_sombra = 8;

som_hit = snd_beehit;
