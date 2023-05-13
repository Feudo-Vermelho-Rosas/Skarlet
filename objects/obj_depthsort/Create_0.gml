#macro TAG_DEPTHSORT "depthsort"

// Array dos objetos que estão com a tag de depthsort.
depth_array = tag_get_asset_ids(TAG_DEPTHSORT,asset_object);

depthsort = function() {
	// Conte o número de instância na sala com a tag e aumente a ds_grid.
	var _len = array_length(depth_array);
	var _contador = 0;
	
	for (var i=0; i < _len; i++) {
		_contador += instance_number(depth_array[i]);
	}
	ds_grid_resize(depth_grid,2,_contador);
	
	// Salve as instâncias na grid e ordene de acordo com o y.
	var _grid_posicao = 0;
	for (var i=0; i < _len; i++) {
		for (var j=0; j < instance_number(depth_array[i]); j++) {
			var _instancia = instance_find(depth_array[i], j);
			depth_grid[# 0, _grid_posicao] = _instancia.id;
			depth_grid[# 1, _grid_posicao] = _instancia.y;
			_grid_posicao++;
		}
	}
	ds_grid_sort(depth_grid,1,true)
	
	// Desenhe as instâncias com a profundidade adequada.
	for (var i=0; i < ds_grid_height(depth_grid); i++) {
		var _instancia = depth_grid[# 0, i];
		with (_instancia) {
			event_perform(ev_draw,0);
		}
	}
}




