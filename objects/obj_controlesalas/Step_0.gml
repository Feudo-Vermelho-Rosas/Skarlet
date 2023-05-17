if instance_number(obj_inimigo) == 0 {
	if !instance_exists(obj_trocasala) {
		var _x = room_width/2;
		var _y = room_height/2;
		instance_create_layer(_x,_y,"Instances",obj_trocasala);
	}
}

