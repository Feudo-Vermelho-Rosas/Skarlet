var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


if inventario == true{
	#region Inventário.
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2;
	
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;
	
	for(var i = 0; i < total_slots; i++){
		
		var _slotsx = _invx + comeco_x + ((tamanho_slot + bufferx) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slot + buffery) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy + tamanho_slot){
			draw_sprite_ext(spr_inventario_seletor, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			if keyboard_check_pressed(ord("F")) and grid_items[# Infos.Item, i] != -1{
				var _inst = instance_create_layer(obj_personagem.x, obj_personagem.y, "Instances", obj_item);
				_inst.sprite_index = grid_items[# Infos.Sprite, i];
				_inst.image_index = grid_items[# Infos.Item, i];
				_inst.quantidade = grid_items[# Infos.Quantidade, i];
				
				// Esvaziando o Slot
				grid_items[# Infos.Item, i] = -1;
				grid_items[# Infos.Quantidade, i] = -1;
				grid_items[# Infos.Sprite, i] = -1;
			}
			
			// Controle de seleção do mouse.
			if mouse_check_button_pressed(mb_left){
				
				// Caso não tenha nenhum item selecionado
				if item_selecionado == -1{
					item_selecionado = grid_items[# Infos.Item, i];
					pos_selecionado = i;
					
				} else { // Caso já tenha um item selecionado
					
					// 1- Caso o item selecionado seja igual do slot que iremos colocar.
					if item_selecionado == grid_items[# Infos.Item, i] and pos_selecionado != i and grid_items[# Infos.Sprite, i] == grid_items[# Infos.Sprite, pos_selecionado]{
						// Itens agrupáveis
						if grid_items[# Infos.Item, pos_selecionado] <= 1{
							grid_items[# Infos.Quantidade, i] += grid_items[# Infos.Quantidade , pos_selecionado];
						
							grid_items[# Infos.Item, pos_selecionado] = -1;
							grid_items[# Infos.Quantidade, pos_selecionado] = -1;
							item_selecionado = -1;
							pos_selecionado = -1;
						} else { // Itens não-agrupáveis
							var _item = grid_items[# Infos.Item, i];
							var _quantidade = grid_items[# Infos.Quantidade, i];
							var _spr = grid_items[# Infos.Sprite, i];
						
							grid_items[# Infos.Item, i] = grid_items[# Infos.Item, pos_selecionado];
							grid_items[# Infos.Quantidade, i] = grid_items[# Infos.Quantidade, pos_selecionado];
							grid_items[# Infos.Sprite, i] = grid_items[# Infos.Sprite, pos_selecionado];
						
							grid_items[# Infos.Item, pos_selecionado] = _item;
							grid_items[# Infos.Quantidade, pos_selecionado] = _quantidade;
							grid_items[# Infos.Sprite, pos_selecionado] = _spr;
						
							item_selecionado = -1;
							pos_selecionado = -1;
						}
					}
					
					// 2- Caso o slot selecionado esteja vazio.
					else if grid_items[# Infos.Item, i] == -1{
						grid_items[# Infos.Item, i] = grid_items[# Infos.Item, pos_selecionado];
						grid_items[# Infos.Quantidade, i] = grid_items[# Infos.Quantidade, pos_selecionado];
						grid_items[# Infos.Sprite, i] = grid_items[# Infos.Sprite, pos_selecionado];
						
						grid_items[# Infos.Item,pos_selecionado] = -1;
						grid_items[# Infos.Quantidade,pos_selecionado] = -1;
						grid_items[# Infos.Sprite,pos_selecionado] = -1;
						
						item_selecionado = -1;
						pos_selecionado = -1;
						
					}
					
					// 3- Caso o slot selecionado já tenha um item e iremos trocar as posições.
					else if grid_items [# Infos.Item, pos_selecionado] != grid_items[# Infos.Item, i] or grid_items[# Infos.Sprite, pos_selecionado] != grid_items[# Infos.Sprite, i]{
						var _item = grid_items[# Infos.Item, i];
						var _quantidade = grid_items[# Infos.Quantidade, i];
						var _spr = grid_items[# Infos.Sprite, i];
						
						grid_items[# Infos.Item, i] = grid_items[# Infos.Item, pos_selecionado];
						grid_items[# Infos.Quantidade, i] = grid_items[# Infos.Quantidade, pos_selecionado];
						grid_items[# Infos.Sprite, i] = grid_items[# Infos.Sprite, pos_selecionado];
						
						grid_items[# Infos.Item, pos_selecionado] = _item;
						grid_items[# Infos.Quantidade, pos_selecionado] = _quantidade;
						grid_items[# Infos.Sprite, pos_selecionado] = _spr;
						
						item_selecionado = -1;
						pos_selecionado = -1;
					}
				}
			}
			
			// Usar item.
			if mouse_check_button_pressed(mb_right) {
				
				var _id = grid_items[# Infos.Item, i];
				
				#region Utilizações por IDs.
				switch _id {
					case 0: // Poção de cura.
						
						obj_personagem.hp += 50;
						if obj_personagem.hp > obj_personagem.max_hp {
							obj_personagem.hp = obj_personagem.max_hp;
						}
						
						// Use somente um item, subtraia a quantidade por 1;
						grid_items[# Infos.Quantidade, i] -= 1;
						if grid_items[# Infos.Quantidade, i] <= 0 {
							// Esvazia o slot se tiver menos que 1 item.
							grid_items[# Infos.Item, i] = -1;
							grid_items[# Infos.Quantidade, i] = -1;
							grid_items[# Infos.Sprite, i] = -1;
						}
						
					break;
					
					case 1: // Armadura Padrão.
						equipar_defesa(i);
						obj_personagem.defesa = 3;
					break;
					
					case 2: // Espada Padrão.
						equipar_arma(i);
						obj_personagem.dano = 5;
					break;
						
					case 3: // Armadura Debug.
						equipar_defesa(i);
						obj_personagem.defesa = 7;
					break;
					
					case 4: // Espada Debug.
						equipar_arma(i);
						obj_personagem.dano = 10;
					break;
					
				}
				#endregion
			}
			
		}
		
		
		var _sprite =  grid_items[# Infos.Sprite, i];
		
		// Função que desenha o item e a quantidade do item
		// Checar se tem um item no slot
		if grid_items[# Infos.Item, i] != -1 {
			// Sprite
			draw_sprite_ext(_sprite, grid_items[# Infos.Item, i],
							_slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			// Quantidade
			if grid_items[# Infos.Item, i] <= 0 { // Itens agrupáveis
				draw_set_font(ft_Inv);
				draw_set_halign(fa_center);
				draw_text_outline(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8,
								  grid_items[# Infos.Quantidade, i], 4, c_black, 16, 100, 100);
			}
		}
		
		ix++;
		if ix >= slots_h{
			ix = 0;
			iy++;
		}
	}
	
	//4 - Largar o item selecionado
	if mouse_check_button_pressed(mb_right){
		item_selecionado = -1;
		pos_selecionado = -1;
	}
		
	
	if item_selecionado != -1{
		draw_sprite_ext(grid_items[# Infos.Sprite, pos_selecionado], item_selecionado, _mx, _my, escala, escala, 0, c_white, .5);
	}
	#endregion
	
	#region Equips.
	
	// Parte do equipamento e das armas.
	var ix = 0;
	var iy = 0;
	
	for(var i = 0; i < 2; i++){
		
		var _slotsx = _invx + comeco_equips_x + ((tamanho_slot + bufferx) * ix);
		var _slotsy = _invy + comeco_equips_y + ((tamanho_slot + buffery) * iy);
	
		var _sprite =  grid_equips[# Infos.Sprite, i];
		
		// Função que desenha o item e a quantidade do item
		// Checar se tem um item no slot
		if grid_equips[# Infos.Item, i] != -1 {
			// Sprite
			draw_sprite_ext(_sprite, grid_equips[# Infos.Item, i],
							_slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			// Quantidade
			if grid_equips[# Infos.Item, i] <= 0 { // Itens agrupáveis
				draw_set_font(ft_Inv);
				draw_set_halign(fa_center);
				draw_text_outline(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8,
								  grid_equips[# Infos.Quantidade, i], 4, c_black, 16, 100, 100);
			}
		}
		
		ix++;
	}
	
	
	// Parte dos dados de ataque, defesa e vida.
	var _textox = _invx + comeco_dados_x;
	var _textoy = _invy + comeco_dados_y;
	
	var _dano = string(obj_personagem.dano);
	var _defesa = string(obj_personagem.defesa);
	var _max_hp = string(obj_personagem.max_hp);
	
	draw_set_font(ft_menu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	draw_text_color(_textox+espacamento*0,_textoy,_dano,c_black,c_black,c_black,c_black,1);
	draw_text_color(_textox+espacamento*1,_textoy,_defesa,c_black,c_black,c_black,c_black,1);
	draw_text_color(_textox+espacamento*2,_textoy,_max_hp,c_black,c_black,c_black,c_black,1);
	
	// Imagem do personagem.
	
	var _x = comeco_x + 172 * escala + _invx;
	var _y = comeco_y + 0 * escala + _invy;
	
	draw_sprite_ext(spr_personagem_baixo,0,_x,_y,escala+1,escala+1,0,c_white,1);
	
	#endregion
}

