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
	
function draw_text_outline(x,y,str,outwidth,outcol,outfidelity,_separation,width) {

	//Created by Andrew McCluskey http://nalgames.com/

	//x,y: Coordinates to draw
	//str: String to draw
	//arugment3 = outwidth: Width of outline in pixels
	//argument4 = outcol: Colour of outline (main text draws with regular set colour)
	//argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	//argument6 = separation, for the draw_text_EXT command.
	//argument7 = width for the draw_text_EXT command.


	//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
	var dto_dcol = draw_get_color();

	draw_set_color(argument4);

	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
	  //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
	  draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
	}

	draw_set_color(dto_dcol);

	draw_text_ext(argument0,argument1,argument2,argument6,argument7);

	/* Original code, in case I mess something up.
	var dto_dcol=draw_get_color();

	draw_set_color(argument4);

	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
	    draw_text(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2);
	}

	draw_set_color(dto_dcol);

	draw_text(argument0,argument1,argument2);
	*/
}
	
function ds_grid_add_item(){
	///@arg Item
	///@arg Quantidade
	///@arg Sprite
	
	var _grid = obj_inventario.grid_items;
	
	var _checagem = 0;
	while _grid[# Infos.Item, _checagem] != -1{
		_checagem++;
	}
	
	_grid[# 0, _checagem] = argument[0];
	_grid[# 1, _checagem] = argument[1];
	_grid[# 2, _checagem] = argument[2];
}