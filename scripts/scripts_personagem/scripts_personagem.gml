// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
	ataque = keyboard_check(vk_space);
	
	if ataque {
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
	
