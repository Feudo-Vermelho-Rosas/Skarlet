/// @description

// Movimento.
x_destino = obj_personagem.x;
y_destino = obj_personagem.y;

veloc = 3;
veloc_dir = point_direction(x,y,x_destino,y_destino);
direcao = veloc_dir;
image_angle = direcao - 45;
hveloc = lengthdir_x(veloc, veloc_dir);
vveloc = lengthdir_y(veloc, veloc_dir);

// Stats.
dano = 5;
kb = 3 ;

// Alarmes.
vida_tempo = 300; // 6 segundos.
