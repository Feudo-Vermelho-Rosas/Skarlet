/// @description

// Movimento.
x_destino = obj_personagem.x;
y_destino = obj_personagem.y;

veloc = 1.5;
veloc_dir = point_direction(x,y,x_destino,y_destino);
hveloc = lengthdir_x(veloc, veloc_dir);
vveloc = lengthdir_y(veloc, veloc_dir);

// Stats.
dano = 0;
kb = 0;

// Alarmes.
vida_tempo = 60; // 1 segundo