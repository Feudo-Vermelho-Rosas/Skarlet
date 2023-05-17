 /*
Data structure de profundidade.
	Coluna 0: id das instâncias.
	Coluna 1: posição das instâncias.
*/
depth_grid = ds_grid_create(2,0);

// Array dos objetos que estão com a tag de depthsort.
depth_array = tag_get_asset_ids(TAG_DEPTHSORT,asset_object);

// Altera o visible dos objetos para false.
for (var i = 0; i < array_length(depth_array); i++) {
	var _obj = depth_array[i];
	// Para os que já existem.
	with (_obj) {
		visible = false;
	}
	// Para os que forem criados.
	object_set_visible(_obj, false)
}
