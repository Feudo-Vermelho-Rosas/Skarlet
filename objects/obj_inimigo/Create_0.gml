/// @description

// Estado
estado = scr_inimigo_escolha;

proximo_estado = 0;
duracao_estado = 180; // Representa a duração média de cada estado.
alarme_estado = 0;

perseguindo = false;
dist_perseguir = 80;

// Movimento
veloc_perseguir = 0.7;
veloc = 0.3;
veloc_dir = 0;
hveloc = 0;
vveloc = 0;

kb_speed = 0;

// Stats
hp = 20;
defesa = 0;
dano = 5;
kb = 3;