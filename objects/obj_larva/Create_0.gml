/// @description

// Inherit the parent event
event_inherited();

// Estado
estado = scr_inimigo_escolha;
proximo_estado = 0;
dist_aggro = 80;
invulneravel = false;
perseguindo = false;
combate = false;

// Stats
max_hp = 15;
hp = max_hp;
defesa = 0;
dano = 8;
kb = 3;
drop = -1;
xp = 6;
reward = 2;

// Desenho.
sprite_andando = spr_larva_andando;
sprite_parado = spr_larva_parada;
sprite_atacando = spr_larva_atacando;
y_sombra = 6;

// Combate
index_ataque = 5;
projetil = obj_gosma;
projetil_atirado = false;

som_hit = snd_wormhit;
