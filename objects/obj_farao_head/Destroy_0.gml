// Spawne 3 projéteis extras.
var _i = 0;
repeat (3) {
	var _projetil = instance_create_layer(x,y,"Instances",obj_farao_head_menor);
	_projetil.veloc_dir = veloc_dir + 120 * _i;
	_projetil.dano = dano/2;
	_i++;
}
