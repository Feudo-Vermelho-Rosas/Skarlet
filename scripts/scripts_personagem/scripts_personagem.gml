// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_personagem_andando(){
	
	#region Movimento.
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);

	// Determine a direção do movimento.
	hveloc = (right - left);
	vveloc = (down - up);
	
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
	
	// Arredonde a posição.
	/*
	x = floor(x);
	y = floor(y);
	*/
	
	#endregion
	
}