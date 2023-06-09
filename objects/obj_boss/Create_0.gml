/// @description Modelo padrão boss
randomize();

// Estado.
estado = scr_boss_criacao;
escolha = -1;
controle_direcao = -1;
controle_hp = -1;
proximo_estado = -1;
rage = false;
invulneravel = false;
alpha_add = 0;

// Movimento.
veloc_avanco = 6;
veloc = 2;
vveloc = 0;
hveloc = 0;
veloc_dir = 0;
direcao = 0;

// Stats
max_hp = 200;
hp = 200;
defesa = 0;
dano = 12;
kb = 6;
xp = 100;

// Desenho
sprite_avancando = -1;
sprite_parado = -1;

#region Alarmes e timers.
duracao_spawn = 120 // 2 segundos.
alarme_spawn = duracao_spawn;
duracao_cooldown = 120 // 2 segundos.
alarme_cooldown = duracao_cooldown;
duracao_hit = 30 // 0.5 segundo.
alarme_hit = 0;
invulneravel_duracao = 240; // 4 segundos.
invulneravel_alarme = invulneravel_duracao;
#endregion
