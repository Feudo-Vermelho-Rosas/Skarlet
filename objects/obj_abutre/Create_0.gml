/// @description Inimigo abutre.

// Inherit the parent event
event_inherited();

// Stats
max_hp = 40;
hp = max_hp;
defesa = 4;
dano = 20;
kb = 3;
drop = -1;
xp = 20;
reward = 3;

// Movimento.
veloc = 0.6;

// Drop.
id_drop = Itens.PocaoForca;
chance_drop = 0.20;
quantidade = 1;

// Desenho.
sprite_andando = spr_abutre_voando;
sprite_parado = spr_abutre_parado;
sprite_perseguindo = spr_abutre_voando;
y_sombra = 11;

som_hit = snd_abutre_hit;