/// @description Boss Faraó.

// Inherit the parent event
event_inherited();

// Estado.
estado = scr_boss_criacao;
escolha = scr_boss_farao_escolha;
hit = scr_boss_farao_hit;
qntd_spawn_mumias = 2;
qntd_tijolos = 5;
qntd_maldicao = 10;
atacando = false;
controle_direcao = scr_boss_farao_controle_sprite;
controle_hp = scr_boss_farao_controle_hp;

// Movimento.
dest_x = 0;
dest_y = 0;

// Stats
max_hp = 600;
hp = max_hp;
defesa = 0;
dano = 30;
dano_head = 25
dano_plataformas = 30; 
kb = 6;
xp = 200;

// Drops.
id_drop_1 = Itens.CruzFarao;
id_drop_2 = choose(Itens.ArmaduraFarao,Itens.Khopesh);
id_drop_3 = Itens.RosaLaranja
quantidade_1 = 1;
quantidade_2 = 1;
quantidade_3 = 1;

// Desenho.
sprite_parado_frente = spr_boss_farao_parado_frente;
sprite_parado_costas = spr_boss_farao_costas_parado;
sprite_parado_lado = spr_boss_farao_parado_lado;
sprite_atacando_frente = spr_boss_farao_ataque_frente;
sprite_atacando_costas = spr_boss_farao_ataque_costas;
sprite_atacando_lado = spr_boss_farao_ataque_lado;

#region Alarmes e timers.
duracao_mumias = 240;
alarme_mumias = 0;
duracao_head = 240;
alarme_head = 0;
duracao_tijolos = 240;
alarme_tijolos = 0;
duracao_maldicao = 240;
alarme_maldicao = 0;
#endregion



