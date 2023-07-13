///@description Sistema de inventário.
#region Inventário.

// Profundidade.
depth = DEPTHS.INVENTARIO;

//Verificar se o inventario esta ativo
inventario = false;
escala = 4;

///Pixel aonde que começa o inventario 
comeco_x = 19 * escala;
comeco_y = 40 * escala;

///Quantos espaços temos para inventario
slots_h = 7;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slot = 16 * escala;
bufferx = 4 * escala;
buffery = 5 * escala;

inventario_l = sprite_get_width(spr_inventario) * escala;
inventario_a = sprite_get_height(spr_inventario) * escala;

item_selecionado = -1;
pos_selecionado = -1;

// Começo não agrupáveis.
global.id_nao_agrupaveis = 6; 

//Tudo que está aqui vai enumerar.
enum Itens{
	PocaoRegen,
	PocaoForca,
	PocaoDefesa,
	PocaoVelocidade,
	FavoMel,
	RosaLaranja,
	CruzFarao,
	RosaVermelha,
	EspadaPadrao,
	EspadaMadeira,
	EspadaFavo,
	EspadaCacto,
	Khopesh,
	ArmaduraPadrao,
	ArmaduraFavo,
	ArmaduraMadeira,
	ArmaduraCacto,
	ArmaduraFarao,
	Altura // altura so para saber quantos item tem
}

// Identificar a coluna e linhas
// Modificar isso para ter so um Item para objs como espada etc.
enum Infos{
	Item,
	Quantidade,
	Sprite,
	Altura
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos.Altura - 1, total_slots - 1, -1);

#endregion

#region Equips.

	// Pixel aonde que começa o inventário.
	comeco_equips_x = 174 * escala;
	comeco_equips_y = 60 * escala;

	// Quantos espaços temos para inventário.
	slots_equips_h = 2;
	slots_equips_v = 1;
	
	// Grid dos equips.
	grid_equips = ds_grid_create(Infos.Altura, 2);
	ds_grid_set_region(grid_equips, 0, 0, Infos.Altura - 1, 2 - 1, -1);

	ds_grid_add_equip(Itens.EspadaPadrao, 1, spr_items_armas);
	ds_grid_add_equip(Itens.ArmaduraPadrao, 1, spr_items_armas);
	
	// Pixel onde começa os dados
	comeco_dados_x = 177 * escala ;
	comeco_dados_y = 88 * escala;
	espacamento = 15 * escala;

#endregion

#region Timers.
global.alarme_cura_delay = 0;
duracao_cura_delay = 20*60;
global.alarme_forca_duracao = 0;
duracao_forca = 30*60;
global.alarme_defesa_duracao = 0;
duracao_defesa = 30*60;
global.alarme_velocidade_duracao = 0;
duracao_velocidade = 30*60;
#endregion

#region Métodos.
draw_item = function(_grid, _i, _slotsx, _slotsy) {
	/// Função que desenha o item e a quantidade do item.
	
	var _sprite =  _grid[# Infos.Sprite, _i];
		
	// Checar se tem um item no slot.
	if _grid[# Infos.Item, _i] != -1 {
		// Sprite.
		draw_sprite_ext(_sprite, _grid[# Infos.Item, _i],
						_slotsx, _slotsy, escala, escala, 0, c_white, 1);
		
		// Quantidade.
		if _grid[# Infos.Item, _i] <= global.id_nao_agrupaveis-1 { // Itens agrupáveis.
			draw_set_font(fnt_inv);
			draw_set_halign(fa_center);
			draw_text_outline(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8,
							  grid_items[# Infos.Quantidade, _i], 4, c_black, 16, 100, 100);
		}
	}
}

draw_gui_equips = function(_invx, _invy) {
	// Desenha a gui de equips.
	
	// Parte dos dados de ataque, defesa e vida.
	var _textox = _invx + comeco_dados_x;
	var _textoy = _invy + comeco_dados_y;
	
	var _dano = string(obj_personagem.dano);
	var _defesa = string(obj_personagem.defesa);
	var _max_hp = string(obj_personagem.max_hp);
	
	draw_set_font(fnt_menu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	draw_text_color(_textox+espacamento*0,_textoy,_dano,c_black,c_black,c_black,c_black,1);
	draw_text_color(_textox+espacamento*1,_textoy,_defesa,c_black,c_black,c_black,c_black,1);
	draw_text_color(_textox+espacamento*2,_textoy,_max_hp,c_black,c_black,c_black,c_black,1);
	
	// Imagem do personagem.
	
	var _x = comeco_x + 172 * escala + _invx;
	var _y = comeco_y + 0 * escala + _invy;
	
	draw_sprite_ext(spr_personagem_baixo,0,_x,_y,escala+1,escala+1,0,c_white,1);
}

controle_selecao = function(_i,_mx,_my,_slotsx,_slotsy) {
	// Controle de seleção de um slot.
	
	if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy + tamanho_slot) {
		
		// Desenhe o sprite de seletor.
		draw_sprite_ext(spr_inventario_seletor, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
		
		// Drop de item.
		if keyboard_check_pressed(ord("F")) and grid_items[# Infos.Item, _i] != -1{
			var _inst = instance_create_layer(obj_personagem.x, obj_personagem.y, "Instances", obj_item);
			_inst.image_index = grid_items[# Infos.Item, _i]; 
			_inst.quantidade = grid_items[# Infos.Quantidade, _i];
		
			// Esvaziando o Slot
			grid_items[# Infos.Item, _i] = -1;
			grid_items[# Infos.Quantidade, _i] = -1;
			grid_items[# Infos.Sprite, _i] = -1;
				
			// Solte o item selecionado.
			item_selecionado = -1;
			pos_selecionado = -1;
		}
	
		// Controle de seleção do mouse.
		if mouse_check_button_pressed(mb_left){
		
			// Caso não tenha nenhum item selecionado
			if item_selecionado == -1{
				item_selecionado = grid_items[# Infos.Item, _i];
				pos_selecionado = _i;
			
			} else { // Caso já tenha um item selecionado
			
				// 1- Caso o item selecionado seja igual do slot que iremos colocar.
				if item_selecionado == grid_items[# Infos.Item, _i] and pos_selecionado != _i and grid_items[# Infos.Sprite, _i] == grid_items[# Infos.Sprite, pos_selecionado]{
					// Itens agrupáveis
					if grid_items[# Infos.Item, pos_selecionado] <= global.id_nao_agrupaveis-1{
						grid_items[# Infos.Quantidade, _i] += grid_items[# Infos.Quantidade , pos_selecionado];
				
						grid_items[# Infos.Item, pos_selecionado] = -1;
						grid_items[# Infos.Quantidade, pos_selecionado] = -1;
						item_selecionado = -1;
						pos_selecionado = -1;
					} else { // Itens não-agrupáveis
						var _item = grid_items[# Infos.Item, _i];
						var _quantidade = grid_items[# Infos.Quantidade, _i];
						var _spr = grid_items[# Infos.Sprite, _i];
				
						grid_items[# Infos.Item, _i] = grid_items[# Infos.Item, pos_selecionado];
						grid_items[# Infos.Quantidade, _i] = grid_items[# Infos.Quantidade, pos_selecionado];
						grid_items[# Infos.Sprite, _i] = grid_items[# Infos.Sprite, pos_selecionado];
				
						grid_items[# Infos.Item, pos_selecionado] = _item;
						grid_items[# Infos.Quantidade, pos_selecionado] = _quantidade;
						grid_items[# Infos.Sprite, pos_selecionado] = _spr;
				
						item_selecionado = -1;
						pos_selecionado = -1;
					}
				}
			
				// 2- Caso o slot selecionado esteja vazio.
				else if grid_items[# Infos.Item, _i] == -1{
					grid_items[# Infos.Item, _i] = grid_items[# Infos.Item, pos_selecionado];
					grid_items[# Infos.Quantidade, _i] = grid_items[# Infos.Quantidade, pos_selecionado];
					grid_items[# Infos.Sprite, _i] = grid_items[# Infos.Sprite, pos_selecionado];
				
					grid_items[# Infos.Item,pos_selecionado] = -1;
					grid_items[# Infos.Quantidade,pos_selecionado] = -1;
					grid_items[# Infos.Sprite,pos_selecionado] = -1;
				
					item_selecionado = -1;
					pos_selecionado = -1;
						
				}
					
				// 3- Caso o slot selecionado já tenha um item e iremos trocar as posições.
				else if grid_items [# Infos.Item, pos_selecionado] != grid_items[# Infos.Item, _i] or grid_items[# Infos.Sprite, pos_selecionado] != grid_items[# Infos.Sprite, _i]{
					var _item = grid_items[# Infos.Item, _i];
					var _quantidade = grid_items[# Infos.Quantidade, _i];
					var _spr = grid_items[# Infos.Sprite, _i];
				
					grid_items[# Infos.Item, _i] = grid_items[# Infos.Item, pos_selecionado];
					grid_items[# Infos.Quantidade, _i] = grid_items[# Infos.Quantidade, pos_selecionado];
					grid_items[# Infos.Sprite, _i] = grid_items[# Infos.Sprite, pos_selecionado];
				
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
			controle_uso(_i);
		}
	}
	
	// 4- Largue o item.
	if mouse_check_button_pressed(mb_right){
			item_selecionado = -1;
			pos_selecionado = -1;
		}
		
	// Desenha o item selecionado.
	if item_selecionado != -1{
		draw_sprite_ext(grid_items[# Infos.Sprite, pos_selecionado], item_selecionado, _mx, _my, escala, escala, 0, c_white, .5);
	}
	
}

controle_uso = function(_i) {
	// Faz o controle de uso dos itens do inventário.
	
	var _id = grid_items[# Infos.Item, _i];
		
	var _dano_base = obj_personagem.dano_base;
	var _defesa_base = obj_personagem.defesa_base;
	
	switch _id {
		case Itens.PocaoRegen: // Poção de cura.
			curar(_i,25,snd_pocao);
		break;
		
		case Itens.PocaoForca: // Poção de força.
			aplicar_forca(_i,4,snd_pocao);
		break;
			
		case Itens.PocaoVelocidade: // Poção de velocidade.
			aplicar_veloc(_i,0.5,snd_pocao);
		break;
			
		case Itens.PocaoDefesa: // Poção de defesa.
			aplicar_defesa(_i,5,snd_pocao);
		break;
			
		case Itens.FavoMel: // Favo de cura.
			curar(_i,50,snd_comendo);
		break;
			
		case Itens.ArmaduraPadrao: // Armadura Padrão.
			equipar_defesa(_i);
			obj_personagem.defesa_equip = 2;
		break;
			
		case Itens.ArmaduraMadeira: // Armadura de Madeira Encantada.
			equipar_defesa(_i);
			obj_personagem.defesa_equip = 4;
		break;
		
		case Itens.ArmaduraFavo: // Armadura de Favo de Mel.
			equipar_defesa(_i);
			obj_personagem.defesa_equip = 6;
		break;
					
		case Itens.ArmaduraCacto: // Armadura de cacto.
			equipar_defesa(_i);
			obj_personagem.defesa_equip = 9;
		break;
					
		case Itens.ArmaduraFarao: // Armadura de faraó.
			equipar_defesa(_i);
			obj_personagem.defesa_equip = 12;
		break;
					
		case Itens.EspadaPadrao: // Espada Padrão.
			equipar_arma(_i);
			obj_personagem.dano_equip = 4;
		break;
					
		case Itens.EspadaMadeira: // Espada de Madeira Encantada.
			equipar_arma(_i);
			obj_personagem.dano_equip = 7;
		break;
					
		case Itens.EspadaFavo: // Espada de Favo de Mel.
			equipar_arma(_i);
			obj_personagem.dano_equip = 9;
		break;
					
		case Itens.EspadaCacto: // Espada de cacto.
			equipar_arma(_i);
			obj_personagem.dano_equip = 11;
		break;
					
		case Itens.Khopesh: // Espada de faraó.
			equipar_arma(_i);
			obj_personagem.dano_equip = 14;
		break;
					
	}

}

draw_nome_item = function(_id_item) {
	// Função que desenha o nome dos itens se o mouse estiver em cima.
	
	var _mousex = device_mouse_x_to_gui(0);
	var _mousey = device_mouse_y_to_gui(0);
	
	var _x = _mousex+8;
	var _y = _mousey-24;
	
	draw_set_font(fnt_inv);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	switch (_id_item) {
		case Itens.PocaoRegen:
			draw_text_outline(_x, _y, "Poção de cura", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.PocaoForca:
			draw_text_outline(_x, _y, "Poção de força", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.PocaoDefesa:
			draw_text_outline(_x, _y, "Poção de defesa", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.PocaoVelocidade:
			draw_text_outline(_x, _y, "Poção de velocidade", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.FavoMel:
			draw_text_outline(_x, _y, "Favô de mel", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.RosaLaranja:
			draw_text_outline(_x, _y, "Rosa laranja", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.CruzFarao:
			draw_text_outline(_x, _y, "Ankh", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.RosaVermelha:
			draw_text_outline(_x, _y, "Rosa vermelha", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.EspadaPadrao:
			draw_text_outline(_x, _y, "Espada padrão", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.EspadaMadeira:
			draw_text_outline(_x, _y, "Espada encantada", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.EspadaFavo:
			draw_text_outline(_x, _y, "Espada de favô", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.EspadaCacto:
			draw_text_outline(_x, _y, "Espada de osso", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.Khopesh:
			draw_text_outline(_x, _y, "Khopesh", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.ArmaduraPadrao:
			draw_text_outline(_x, _y, "Armadura padrão", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.ArmaduraFavo:
			draw_text_outline(_x, _y, "Armadura de favô", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.ArmaduraMadeira:
			draw_text_outline(_x, _y, "Armadura encantada", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.ArmaduraCacto:
			draw_text_outline(_x, _y, "Armadura de osso", 4, c_black, 16, 1000, 1000);
		break;
		case Itens.ArmaduraFarao:
			draw_text_outline(_x, _y, "Armadura do faraó", 4, c_black, 16, 1000, 1000);
		break;
	}
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}

add_item = function(_id_item, _qntd, _sprite) {
	// Este método adiciona um item ao inventário.
	
	// Pegue a data grid do inventário.
	var _grid = obj_inventario.grid_items;
	var _adicionado = false;
	
	// Neste primeiro loop, procure por itens iguais no inventário.
	var _checagem = 0;
	do {
		if (_grid[# Infos.Item, _checagem] == _id_item) {
			if (_id_item < global.id_nao_agrupaveis) { // Verifique se o item é agrupável.
				// Adicione na quantidade.
				_grid[# 1, _checagem] += _qntd;
				_adicionado = true;
				break;
			}
		}
		_checagem++;
	} until (_checagem > obj_inventario.total_slots);
	
	// Neste segundo loop, caso o primeiro falhe, procure por slots vazios.
	if !_adicionado {
		_checagem = 0;
		do {
			if (_grid[# Infos.Item, _checagem] == -1) { // Veja se o slot está vazio.
				// Adicione o item novo.
				_grid[# 0, _checagem] = _id_item;
				_grid[# 1, _checagem] = _qntd;
				_grid[# 2, _checagem] = _sprite;
				_adicionado = true;
				break;
			}
			_checagem++;
		} until _adicionado;
	}
}
#endregion

add_item(Itens.PocaoRegen, 5, spr_items_armas);