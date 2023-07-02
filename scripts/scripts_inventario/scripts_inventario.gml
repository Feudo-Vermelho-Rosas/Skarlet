function ds_grid_add_item() {
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

function ds_grid_add_equip() {
	///@arg Item
	///@arg Quantidade
	///@arg Sprite
	
	var _grid = obj_inventario.grid_equips;
	
	var _checagem = 0;
	while _grid[# Infos.Item, _checagem] != -1{
		_checagem++;
	}
	
	_grid[# 0, _checagem] = argument[0];
	_grid[# 1, _checagem] = argument[1];
	_grid[# 2, _checagem] = argument[2];
}
	
function equipar_arma(posicao_inv) {
	
	var _item = grid_items[# Infos.Item, posicao_inv];
	var _quantidade = grid_items[# Infos.Quantidade, posicao_inv];
	var _spr = grid_items[# Infos.Sprite, posicao_inv];
						
	grid_items[# Infos.Item, posicao_inv] = grid_equips[# Infos.Item, 0];
	grid_items[# Infos.Quantidade, posicao_inv] = grid_equips[# Infos.Quantidade, 0];
	grid_items[# Infos.Sprite, posicao_inv] = grid_equips[# Infos.Sprite, 0];
						
	grid_equips[# Infos.Item, 0] = _item;
	grid_equips[# Infos.Quantidade, 0] = _quantidade;
	grid_equips[# Infos.Sprite, 0] = _spr;
	
	// Efeito sonoro.
	audio_play_sound(snd_equipar_espada,100,false);
	
}

function equipar_defesa(posicao_inv) {
	
	var _item = grid_equips[# Infos.Item, 1];
	var _quantidade = grid_equips[# Infos.Quantidade, 1];
	var _spr = grid_equips[# Infos.Sprite, 1];
						
	grid_equips[# Infos.Item, 1] = grid_items[# Infos.Item, posicao_inv];
	grid_equips[# Infos.Quantidade, 1] = grid_items[# Infos.Quantidade, posicao_inv];
	grid_equips[# Infos.Sprite, 1] = grid_items[# Infos.Sprite, posicao_inv];
						
	grid_items[# Infos.Item, posicao_inv] = _item;
	grid_items[# Infos.Quantidade, posicao_inv] = _quantidade;
	grid_items[# Infos.Sprite, posicao_inv] = _spr;
	
	// Efeito sonoro.
	audio_play_sound(snd_equipar_armadura,100,false);
	
}
	
function remover_um_item(posicao_inv) {
	// Use somente um item, subtraia a quantidade por 1;
	grid_items[# Infos.Quantidade, posicao_inv] -= 1;
	if grid_items[# Infos.Quantidade, posicao_inv] <= 0 {
		// Esvazia o slot se tiver menos que 1 item.
		grid_items[# Infos.Item, posicao_inv] = -1;
		grid_items[# Infos.Quantidade, posicao_inv] = -1;
		grid_items[# Infos.Sprite, posicao_inv] = -1;
	}
}

function curar(inv_posicao, cura, som) {
	// Cura o personagem, remove o item e reseta o alarme.
	if global.alarme_cura_delay <= 0 {
		obj_personagem.hp += cura;
		if obj_personagem.hp > obj_personagem.max_hp {
			obj_personagem.hp = obj_personagem.max_hp;
		}
	
		remover_um_item(inv_posicao);
				
		// Crie o indicador de cura.
		var _indicador = instance_create_layer(x,y,"Instances",obj_indicador_cura);
		_indicador.x1 = obj_personagem.x;
		_indicador.y1 = obj_personagem.y;
		_indicador.cura = cura;
		
		// Efeito sonoro.
		audio_play_sound(som,100,false);
		
		// Resete o alarme de cura.
		global.alarme_cura_delay = duracao_cura_delay;
	}
}

function aplicar_forca(inv_posicao, forca, som) {
	// Aplica a força, remove o item e reseta o alarme.
	if global.alarme_forca_duracao <= 0 {
		obj_personagem.dano_pocao = forca;
		
		remover_um_item(inv_posicao);
		
		// Efeito sonoro.
		audio_play_sound(som,100,false);
		
		// Resete o alarme de força.
		global.alarme_forca_duracao = duracao_forca;
	}
}

function aplicar_defesa(inv_posicao, defesa, som) {
	// Aplica a defesa, remove o item e reseta o alarme.
	if global.alarme_defesa_duracao <= 0 {
		obj_personagem.defesa_pocao = defesa;
		
		remover_um_item(inv_posicao);
		
		// Efeito sonoro.
		audio_play_sound(som,100,false);
		
		// Resete o alarme de força.
		global.alarme_defesa_duracao = duracao_defesa;
	}
}

function aplicar_veloc(inv_posicao, veloc, som) {
	// Aplica a velocidade, remove o item e reseta o alarme.
	if global.alarme_velocidade_duracao <= 0 {
		obj_personagem.veloc_pocao = veloc;
		
		remover_um_item(inv_posicao);
		
		// Efeito sonoro.
		audio_play_sound(som,100,false);
		
		// Resete o alarme de força.
		global.alarme_velocidade_duracao = duracao_velocidade;
	}
}
	
function scr_draw_nome_item(id_item) {
	// Escreva no mouse o nome de um item.
	
	var _mousex = device_mouse_x_to_gui(0);
	var _mousey = device_mouse_y_to_gui(0);
	
	var _x = _mousex+8;
	var _y = _mousey-24;
	
	draw_set_font(ft_Inv);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	switch (id_item) {
		case 1:
			draw_text_outline(_x, _y, "Poção de cura", 4, c_black, 16, 1000, 1000);
		break;
		case 2:
			draw_text_outline(_x, _y, "Poção de força", 4, c_black, 16, 1000, 1000);
		break;
		case 3:
			draw_text_outline(_x, _y, "Poção de defesa", 4, c_black, 16, 1000, 1000);
		break;
		case 4:
			draw_text_outline(_x, _y, "Poção de velocidade", 4, c_black, 16, 1000, 1000);
		break;
		case 5:
			draw_text_outline(_x, _y, "Favô de mel", 4, c_black, 16, 1000, 1000);
		break;
		case 6:
			draw_text_outline(_x, _y, "Rosa laranja", 4, c_black, 16, 1000, 1000);
		break;
		case 7:
			draw_text_outline(_x, _y, "Ankh", 4, c_black, 16, 1000, 1000);
		break;
		case 8:
			draw_text_outline(_x, _y, "Rosa vermelha", 4, c_black, 16, 1000, 1000);
		break;
		case 9:
			draw_text_outline(_x, _y, "Espada padrão", 4, c_black, 16, 1000, 1000);
		break;
		case 10:
			draw_text_outline(_x, _y, "Espada encantada", 4, c_black, 16, 1000, 1000);
		break;
		case 11:
			draw_text_outline(_x, _y, "Espada de favô", 4, c_black, 16, 1000, 1000);
		break;
		case 12:
			draw_text_outline(_x, _y, "Espada de osso", 4, c_black, 16, 1000, 1000);
		break;
		case 13:
			draw_text_outline(_x, _y, "Khopesh", 4, c_black, 16, 1000, 1000);
		break;
		case 14:
			draw_text_outline(_x, _y, "Armadura padrão", 4, c_black, 16, 1000, 1000);
		break;
		case 15:
			draw_text_outline(_x, _y, "Armadura de favô", 4, c_black, 16, 1000, 1000);
		break;
		case 16:
			draw_text_outline(_x, _y, "Armadura encantada", 4, c_black, 16, 1000, 1000);
		break;
		case 17:
			draw_text_outline(_x, _y, "Armadura de osso", 4, c_black, 16, 1000, 1000);
		break;
		case 18:
			draw_text_outline(_x, _y, "Armadura do faraó", 4, c_black, 16, 1000, 1000);
		break;
	}
	
	draw_set_halign(-1);
	draw_set_valign(-1);
}