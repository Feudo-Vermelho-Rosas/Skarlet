///@description Colisão com uma parede.

// Empurre em caso de estar dentro de uma parede.
if place_meeting(x,y,obj_parede) {
	var _dir = point_direction(x,y,other.x,other.y);
	var _empurrao = -2;
	var _empurraox = lengthdir_x(_empurrao, _dir);
	var _empurraoy = lengthdir_y(_empurrao, _dir);
	x += _empurraox;
	y += _empurraoy;
}


