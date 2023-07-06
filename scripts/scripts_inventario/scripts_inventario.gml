function ds_grid_add_item(_id_item, _qtnd, _sprite) {
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
				_grid[# 1, _checagem] += _qtnd;
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
				_grid[# 1, _checagem] = _qtnd;
				_grid[# 2, _checagem] = _sprite;
				break;
			}
			_checagem++;
		} until (_grid[# Infos.Item, _checagem] != -1);
	}
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