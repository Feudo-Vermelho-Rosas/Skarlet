function scr_controle_direcao() {
	
	if hveloc == 0 && vveloc == 0 {
		switch direcao {
			case 0:
				image_xscale = 1;
				sprite_index = spr_personagem_lado;
				break;
			case 1:
				image_xscale = 1;
				sprite_index = spr_personagem_costas;
				break;
			case 2:
				image_xscale = -1;
				sprite_index = spr_personagem_lado;
				break;
			case 3:
				image_xscale = 1;
				sprite_index = spr_personagem_baixo;
				break;
		}
	}
	
	if hveloc < 0 {
		direcao = 2;
		image_xscale = -1;
		sprite_index = spr_personagem_andando_lado;
	} else if hveloc > 0 {
		direcao = 0;
		image_xscale = 1;
		sprite_index = spr_personagem_andando_lado;
	}
	
	if vveloc < 0 {
		direcao = 1;
		image_xscale = 1;
		sprite_index = spr_personagem_andando_cima;
	} else if vveloc > 0 {
		direcao = 3;
		image_xscale = 1;
		sprite_index = spr_personagem_andando_baixo;
	}
	
}

function scr_personagem_andando() {
	
	#region Movimento.
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);

	// Determine a direção do movimento.
	hveloc = (direita - esquerda);
	vveloc = (baixo - cima);
	
	// Aponte a direção da velocidade para a direção do movimento.
	veloc_dir = point_direction(x,y,x+hveloc,y+vveloc);
	
	// Determine a velocidade horizontal e vertical.
	if hveloc != 0 || vveloc != 0 {
		hveloc = lengthdir_x(veloc, veloc_dir);
		vveloc = lengthdir_y(veloc, veloc_dir);
	}
	
	// Cheque colisão.
	scr_checar_colisao();
	
	// Realize o movimento.
	x += hveloc;
	y += vveloc;
	
	#endregion
	
	// Controle a direção;
	scr_controle_direcao();
	
	#region Combate.
	ataque = keyboard_check_pressed(vk_space);
	
	if ataque {
		//audio_play_sound(snd_sword,100,false);
		estado = scr_personagem_combate;
		ataque_alarme = ataque_duracao;
		scr_criar_hitbox_ataque();
		image_index = 0;
	}
	#endregion
	
}

function scr_personagem_hit() {
	
	// Faça o efeito de knockback.
	hveloc = lengthdir_x(kb_speed,veloc_dir);
	vveloc = lengthdir_y(kb_speed,veloc_dir);
	
	scr_checar_colisao();
	
	x += hveloc;
	y += vveloc;
	
	// Cheque o alarme de hit.
	if hit_alarme <= 0 {
		estado = scr_personagem_andando;
	}
	hit_alarme -= 1;
	
}

function scr_criar_hitbox_ataque() {
	
	switch direcao {
		case 0:
			instance_create_layer(x+15,y,"Instances",obj_hitbox_ataque);
			break;
		case 1:
			instance_create_layer(x,y-15,"Instances",obj_hitbox_ataque);
			break;
		case 2:
			instance_create_layer(x-15,y,"Instances",obj_hitbox_ataque);
			break;
		case 3:
			instance_create_layer(x,y+15,"Instances",obj_hitbox_ataque);
			break;
	}
	
}

function scr_personagem_combate() {
	
	switch direcao {
		case 0:
			image_xscale = 1;
			sprite_index = spr_personagem_ataque_lado;
			break;
		case 1:
			image_xscale = 1;
			sprite_index = spr_personagem_ataque_cima;
			break;
		case 2:
			image_xscale = -1;
			sprite_index = spr_personagem_ataque_lado;
			break;
		case 3:
			image_xscale = 1;
			sprite_index = spr_personagem_ataque_baixo;
			break;
	}
	
	hveloc = 0;
	vveloc = 0;
	
	if image_index >= 3 {
		estado = scr_personagem_andando;
		ataque_alarme = 0;
	}
	
	if ataque_alarme <= 0 {
		estado = scr_personagem_andando;
	}
	ataque_alarme -= 1;
	
}
	
function scr_levelup() {
	
	level_max_hp = [100,104,109,115,122,130,139,149,160,172,185,199,214,230,247,265,284,300];
	level_max_xp = [100,110,125,145,170,200,235,275,320,370,425,485,550,620,695,775,860,950];
	level_dano_base = [1,1,1,2,2,3,4,5,7,9,11,14,17,20,23,26,29,32];
	level_defesa_base = [1,1,1,2,2,2,3,3,4,5,6,8,10,13,16,19,21,24];
	
	xp -= level_max_xp[level-1];
	level += 1;
	
	max_hp = level_max_hp[level-1];
	max_xp = level_max_xp[level-1];
	dano_base = level_dano_base[level-1];
	defesa_base = level_defesa_base[level-1];
	
}
	
