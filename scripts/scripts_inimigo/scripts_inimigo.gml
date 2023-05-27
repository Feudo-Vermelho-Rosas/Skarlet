// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Gerais.
function scr_checar_personagem(){
	// Cheque a distância para o personagem.
	
	perto = false;
	
	if distance_to_object(obj_personagem) <= dist_aggro {
		perto = true;
	} else {
		perto = false;
	}
	
	return perto;
}

function scr_inimigo_escolha(){
	
	// Escolha o estado.
	proximo_estado = choose(scr_inimigo_parado, scr_inimigo_andando);
	alarme_estado = irandom_range(duracao_estado-60,duracao_estado+60);
	
	if proximo_estado == scr_inimigo_andando {
		estado = scr_inimigo_andando;
		// Escolha uma direção aleatória para andar.
		veloc_dir = irandom_range(0,359);
	} else if proximo_estado == scr_inimigo_parado {
		estado = scr_inimigo_parado;
	}
}

function scr_inimigo_parado() {
	
	image_speed = 1;
	
	hveloc = 0;
	vveloc = 0;
	
	// Sempre controle a direção.
	scr_controlar_direcao();
	
	if alarme_estado <= 0 {
		estado = scr_inimigo_escolha;
	}
	alarme_estado -= 1;
	
}

function scr_inimigo_andando() {
	
	image_speed = 1;
	
	// Defina a velocidade horizontal e vertical.
	hveloc = lengthdir_x(veloc, veloc_dir);
	vveloc = lengthdir_y(veloc, veloc_dir);
	
	// Cheque colisão.
	scr_checar_colisao();
	
	x += hveloc;
	y += vveloc;
	
	// Sempre controle a direção.
	scr_controlar_direcao();
	
	if alarme_estado <= 0 {
		estado = scr_inimigo_escolha;
	}
	alarme_estado -= 1;
}
	
function scr_inimigo_perseguindo() {
	
	image_speed = 2;
	
	// Aponte para a direção do personagem.
	var _x = obj_personagem.x
	var _y = obj_personagem.y
	veloc_dir = point_direction(x,y,_x,_y);
	
	// Mova para a direção do personagem.
	hveloc = lengthdir_x(veloc_perseguir, veloc_dir);
	vveloc = lengthdir_y(veloc_perseguir, veloc_dir);
	
	// Cheque colisão.
	scr_checar_colisao();
	
	x += hveloc;
	y += vveloc;
	
	// Checar distância para o personagem.
	if perseguindo == false {
		estado = scr_inimigo_escolha;
	}
	
}
	
function scr_inimigo_hit() {
	
	// Faça o efeito de knockback.
	hveloc = lengthdir_x(kb_speed,veloc_dir);
	vveloc = lengthdir_y(kb_speed,veloc_dir);
	
	scr_checar_colisao();
	
	x += hveloc;
	y += vveloc;
	
	// Sempre controle a direção.
	scr_controlar_direcao();
	
	// Cheque o alarme de hit.
	if hit_alarme <= 0 {
		estado = scr_personagem_andando;
	}
	hit_alarme -= 1;
	
}

function scr_controlar_direcao() {
	// Controla os sprites e direção.
	
	if estado != scr_inimigo_hit {
		switch direcao {
			case 0:
				image_xscale = 1;
				sprite_index = sprite_parado;
				break;
			case 2:
				image_xscale = -1;
				sprite_index = sprite_parado;
				break;
		}
	
		if !perseguindo {
			if hveloc < 0 {
				direcao = 2;
				image_xscale = -1;
				sprite_index = sprite_andando;
			} else if hveloc > 0 {
				direcao = 0;
				image_xscale = 1;
				sprite_index = sprite_andando;
			}
		} else {
			if hveloc < 0 {
				direcao = 2;
				image_xscale = -1;
				sprite_index = sprite_perseguindo;
			} else if hveloc > 0 {
				direcao = 0;
				image_xscale = 1;
				sprite_index = sprite_perseguindo;
			}	
		}
	}
}
	
function scr_inimigo_projetil_combate() {
	// Controla o combate de inimigos com ataques de projéteis.
	
	sprite_index = sprite_atacando;
	
	// Controlar direção.
	var _direc_personagem = point_direction(x,y,obj_personagem.x,obj_personagem.y);
	
	if _direc_personagem < 90 || _direc_personagem > 270 {
		direcao = 0;
	} else if _direc_personagem > 90 && _direc_personagem < 270 {
		direcao = 2;
	}
	
	switch direcao {
		case 0:
			image_xscale = 1;
			break;
		case 2:
			image_xscale = -1;
			break;
	}
	
	// Dispare o projétil no ponto certo de animação.
	var _rounded_image_index = (round(image_index*10)/10); // Correção de bug. 
	if _rounded_image_index == index_ataque {
		var _projetil = instance_create_layer(x,y,"Instances",projetil);
		_projetil.dano = dano;
		_projetil.kb = kb;
	}
	
	// Se não estiver mais em combate, mude o estado.
	if combate == false {
		estado = scr_inimigo_escolha;
	}
	
}
	
function scr_inimigo_abelha_perseguindo() {
	
}