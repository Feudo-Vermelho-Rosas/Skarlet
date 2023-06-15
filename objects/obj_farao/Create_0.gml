/// @description Boss Faraó.

// Inherit the parent event
event_inherited();

// Estado.
estado = scr_boss_criacao;
escolha = scr_boss_farao_escolha;
hit = scr_boss_farao_hit;
qntd_spawn_mumias = 3;
controle_direcao = scr_boss_farao_controle_sprite;
controle_hp = scr_boss_controle_hp;

// Stats
max_hp = 600;
hp = 600;
defesa = 0;
dano = 24;
kb = 6;
xp = 100;

// Desenho.
sprite_parado_costas = spr_boss_farao_costas_parado;
sprite_parado = spr_boss_farao_parado;




