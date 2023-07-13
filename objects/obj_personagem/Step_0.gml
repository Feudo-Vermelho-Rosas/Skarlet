// Att os stats;
dano = dano_base + dano_equip + dano_pocao;
defesa = defesa_base + defesa_equip + defesa_pocao;
veloc = veloc_base + veloc_pocao;

// Sistema de pause.
if (global.pause) {
	image_speed = 0
	exit;
}

image_speed = 1;

// Cheque o alarme de hit.
if hit_alarme > 0 {
	estado = scr_personagem_hit;
}

// Execute o estado atual do personagem.
script_execute(estado);

// Controle o level up de níveis.
if xp >= max_xp {
	scr_levelup();
}

// Game over.
if hp <= 0 {
	hp = 0;
	global.pause = true;
	instance_create_depth(0,0,-5000,obj_gameover);
}