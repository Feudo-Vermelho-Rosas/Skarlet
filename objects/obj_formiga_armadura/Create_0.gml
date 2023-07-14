/// @description

// Inherit the parent event
event_inherited();

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
xp = 10;
reward = 1;

// Desenho.
sprite_andando = spr_formiga_armadura_andando;
sprite_parado = spr_formiga_armadura_parada;
sprite_perseguindo = spr_formiga_armadura_andando;
y_sombra = 8;

som_hit = snd_anthit;