/// @description Projétil tijolo.
// Movimento.
x = obj_personagem.x;
y = obj_personagem.y-40;
y_queda = 40;
y_percorrido = 0;
acel = 0.03;
vveloc = 0;

// Stats.
dano = 0;
kb = 0;

// Desenho.
sombra = spr_sombra_media;
y_sombra = y + y_queda;
sprite_index = noone;
mask_index = -1;
sprite = spr_tijolo;
