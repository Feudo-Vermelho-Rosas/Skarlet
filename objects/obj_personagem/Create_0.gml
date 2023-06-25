 /// @description Personagem principal.

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
dano_base = 1;
defesa_base = 1;
dano_equip = 4;
defesa_equip = 2;
dano_pocao = 0;
defesa_pocao = 0;
veloc_base = 1.5;
veloc_pocao = 0;
defesa = 3;
dano = 5;
kb = 3;

level = 1;
max_xp = 100;
xp = 0;

// Desenho;
image_alpha = 1;
alpha_add = 0;
y_sombra = 8;

#region Timers e durações.
hit_alarme = 0;
hit_duracao = 10;
invulneravel_alarme = 0;
invulneravel_duracao = 120; // 2 segundos.
ataque_alarme = 0;
ataque_duracao = 30; // Adaptar à animação.
#endregion