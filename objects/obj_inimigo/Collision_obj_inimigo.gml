/// @description Colisão entre inimigos.
var _dir = point_direction(x,y,other.x,other.y);
var _empurrao = 2;
var _empurraox = lengthdir_x(_empurrao, _dir);
var _empurraoy = lengthdir_y(_empurrao, _dir);


// Cheque colisão horizontal.
if place_meeting(other.x+_empurraox,other.y,obj_parede) {
	if !place_meeting(other.x+sign(_empurraox),other.y,obj_parede) {
		other.x += sign(_empurraox);
	}
	_empurraox = 0;
}
	
// Cheque colisão vertical.
if place_meeting(other.x,other.y+_empurraoy,obj_parede) {
	if !place_meeting(other.x,other.y+sign(_empurraoy),obj_parede) {
		other.y += sign(_empurraoy);
	}
	_empurraoy = 0;
}

other.x += _empurraox;
other.y += _empurraoy; 