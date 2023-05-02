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