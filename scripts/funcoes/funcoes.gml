// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_checar_colisao(){
	// Função para checar colisão.
	
	// Cheque colisão horizontal.
	if place_meeting(x+hveloc,y,obj_parede) {
		if !place_meeting(x+sign(hveloc),y,obj_parede) {
			x += sign(hveloc);
		}
		hveloc = 0;
	}
	
	// Cheque colisão vertical.
	if place_meeting(x,y+vveloc,obj_parede) {
		if !place_meeting(x,y+sign(vveloc),obj_parede) {
			y += sign(vveloc);
		}
		vveloc = 0;
	}
}
	
function scr_efeito_invulneravel() {
	// Controla a invulnerabilidade e seu efeito.
	
	// Faça o efeito de invulnerabilidade.
	if image_alpha >= 1 {
		alpha_add = -0.10;
	} else if image_alpha <= 0 {
		alpha_add = 0.10;
	}	
		
	image_alpha += alpha_add;
		
	if invulneravel_alarme <= 0 {
		invulneravel = false;
	}
	invulneravel_alarme -= 1;
}
	
function scr_calcular_dano_1(dano) {
	/// Decide se o dano é crítico e calcula ele. 
	
	// Dano crítico duplica o dano.
	if random(1) <= 0.05 {
		// Crítico (5% de chance)
		dano = dano * 2;
	}
	
	dano_calculado = irandom_range(dano+2,dano-2);
	
	return dano_calculado;
}

function scr_calcular_dano_2(dano) {
	/// Calcula o dano sem chance de crítico. 
	
	dano_calculado = irandom_range(dano+2,dano-2);
	
	return dano_calculado;
}