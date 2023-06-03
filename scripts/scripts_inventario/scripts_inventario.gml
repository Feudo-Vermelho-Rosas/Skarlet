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
	
}