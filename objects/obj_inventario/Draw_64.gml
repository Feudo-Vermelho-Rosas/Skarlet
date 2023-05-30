var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inventario == true{
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2;
	
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;
	for(var i = 0; i < total_slots; i++){
		
		var _slotsx = _invx + comeco_x + ((tamanho_slot + buffer) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slot + buffer) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy + tamanho_slot){
			draw_sprite_ext(spr_inventario_seletor, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			if keyboard_check_pressed(ord("F")) and grid_items[# Infos.Item, i] != -1{
				var _inst = instance_create_layer(obj_personagem.x, obj_personagem.y, "Instances", obj_item);
				_inst.sprite_index = grid_items[# Infos.Sprite, i];
				_inst.image_index = grid_items[# Infos.Item, i];
				_inst.quantidade = grid_items[# Infos.Quantidade, i];
				
				//Esvaziando o Slot
				grid_items[# Infos.Item, i] = -1;
				grid_items[# Infos.Quantidade, i] = -1;
				grid_items[# Infos.Sprite, i] = -1;
			}
			
			if mouse_check_button_pressed(mb_left){
				//Caso não tenha nenhum item selecionado
				if item_selecionado == -1{
					item_selecionado = grid_items[# Infos.Item, i];
					pos_selecionado = i;
				}//Caso já tenha um item selecionado
				else{
					//1- Caso o item selecionado seja igual do slot que iremos colocar
					if item_selecionado == grid_items[# Infos.Item, i] and pos_selecionado != i and grid_items[# Infos.Sprite, i] == grid_items[# Infos.Sprite, pos_selecionado]{
						grid_items[# Infos.Quantidade, i] += grid_items[# Infos.Quantidade , pos_selecionado];
						
						grid_items[# Infos.Item, pos_selecionado] = -1;
						grid_items[# Infos.Quantidade, pos_selecionado] = -1;
						item_selecionado = -1;
						pos_selecionado = -1;
						
					}
					//2- Caso o slot selecionado esteja vazio
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
					//3- Caso o slot selecionado já tenha um item e iremos trocar as posições
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
		}
		
		var _sprite =  grid_items[# Infos.Sprite, i];
		
		//Checar se tem um item no slot
		if grid_items[# Infos.Item, i] != - 1{
			//Sprite
			draw_sprite_ext(_sprite, grid_items[# Infos.Item, i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			//Quantidade
			draw_set_font(ft_Inv);
			draw_set_halign(fa_center);
			///////Preciso pegar a função do felipe do outline aqui
			draw_text_outline(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8, grid_items[# Infos.Quantidade, i], 4, c_black, 16, 100, 100);
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
}

