// Spawne destroços.
repeat (4) {
	var _x = x + irandom_range(-4,4);
	var _y = y - 4 + irandom_range(-4,4);
	var _destroco = instance_create_layer(_x,_y,"Instances",obj_destroco);
	_destroco.sprite_index = spr_pedacos_tijolo;
	_destroco.image_index = irandom_range(0,2);
}
