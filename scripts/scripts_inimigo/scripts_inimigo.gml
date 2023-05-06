// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Gerais.
function scr_checar_personagem(){
	// Persiga o personagem se ele estiver perto.
	if distance_to_object(obj_personagem) <= dist_perseguir {
		perseguindo = true;
		estado = scr_inimigo_perseguindo;
	} else {
		perseguindo = false;
	}
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
	
	if alarme_estado <= 0 {
		estado = scr_inimigo_escolha;
	}
	alarme_estado -= 1;
}
	
function scr_inimigo_perseguindo() {
	
	image_speed = 2;
	
	// Aponte para a direção do personagem.
	veloc_dir = point_direction(x,y,obj_personagem.x,obj_personagem.y);
	
	// Mova para a direção do personagem.
	hveloc = lengthdir_x(veloc_perseguir, veloc_dir);
	vveloc = lengthdir_y(veloc_perseguir, veloc_dir);
	
	// Cheque colisão.
	scr_checar_colisao();
	
	x += hveloc;
	y += vveloc;
	
	// Checar distância para o personagem.
	scr_checar_personagem();
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
	
	// Cheque o alarme de hit.
	if hit_alarme <= 0 {
		estado = scr_personagem_andando;
	}
	hit_alarme -= 1;
	
}

// Formiga.
function scr_formiga_direcao() {
	
	if estado != scr_inimigo_hit {
		switch direcao {
			case 0:
				sprite_index = spr_formiga_parada_direita;
				break;
			case 2:
				sprite_index = spr_formiga_parada_esquerda;
				break;
		}
	
	
		if hveloc < 0 {
			direcao = 2;
			sprite_index = spr_formiga_andando_esquerda;
		} else if hveloc > 0 {
			direcao = 0;
			sprite_index = spr_formiga_andando_direita;
		}
	}
}