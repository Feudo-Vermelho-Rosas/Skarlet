/// @description Maldição do faraó.

// Crie o sistema de partículas.
sistema = part_system_create(par_maldicao);
part_system_position(sistema,x,y);

// Stats
dano = 10;
kb = 0;

// Alarmes.
tempo_vida = irandom_range(1800,2000);
