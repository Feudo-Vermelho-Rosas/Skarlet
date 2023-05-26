 /// @description

// Estado do personagem.
estado = scr_personagem_andando;
invulneravel = false;

// Teclas.
cima = 0;
baixo = 0;
direita = 0;
esquerda = 0;
ataque = 0;

// Movimento.
direcao = 3;
kb_speed = 0;

veloc = 1.5; // Velocidade de movimentação.
hveloc = 0;
vveloc = 0;
veloc_dir = 0;

// Stats
max_hp = 100;
hp = 100;
defesa = 0;
dano = 20;
kb = 3;

// Desenho;
image_alpha = 1;
alpha_add = 0;

#region Timers e durações.
hit_alarme = 0;
hit_duracao = 10;
invulneravel_alarme = 0;
invulneravel_duracao = 120; // 2 segundos.
ataque_alarme = 0;
ataque_duracao = 30; // Adaptar à animação.
#endregion