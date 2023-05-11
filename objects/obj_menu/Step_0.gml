//get input
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _right_held = keyboard_check_pressed(vk_right);
var _left_held = keyboard_check_pressed(vk_left);
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

//holdig key down
var _repeat_spd = 8;
var _repeat_delay = 25;

//holding right
if _right time_held_right = _repeat_delay;
if time_held_right > 0 {
	time_held_right--;
	if time_held_right == 0 and _right_held {
		_right = true;
		time_held_right = _repeat_spd;
	}
}

//holding left
if _left time_held_left = _repeat_delay;
if time_held_left > 0 {
	time_held_left--;
	if time_held_left == 0 and _left_held {
		_left = true;
		time_held_left = _repeat_spd;
	}
}


var _move = _down - _up;
var _hmove = _right - _left;

if _move != 0{
	///move the index
	index += _move;
	
	//clamp values
	var _size = array_length(menu[sub_menu]);
	if index < 0 index = _size - 1;   //at start, so loop to menu end
	else if index >= _size index = 0;  //at end, so loop to menu start
}

if _select or (is_array(menu[sub_menu][index]) and (_hmove != 0)){
	switch(sub_menu) {
		case MAIN: //main menu
			switch(index) {
				case 0:
					//Novo Jogo
					room_goto_next();
					audio_stop_sound(snd_telainicio);
				break;
				case 1:
					//Opcões
					sub_menu = SETTINGS;
					index = 0;
				break;
				case 2:
					//Sair
				game_end();
				break;
		
			}
		break;
		case SETTINGS: //opções
			switch(index) {
				case 0:
					//Som
					change_menu(_hmove, "som");
				break;
				case 1:
					//Musica
					change_menu(_hmove, "musica");
				break;
				case 2:
					//Controles
					change_menu(_hmove, "controles");
				break;
				case 3:
					//Voltar
					sub_menu = MAIN;
					index = 1;
				break;
		
			}
		break;
	}
}

function change_menu(_move, _key){
	//@desc		change the ds map key entry by the move value passed
	//@_move	 real	 which way to move the selection
	//@_key		string ds_map key for this selection
	
	//get the allowed limits for this selection
	//get map array
	var _map_arr = set[? _key];
	//get the limits array
	var _limits_arr = _map_arr[1];
	
	//is the fist entry in the limits an integer?
	if is_real(_limits_arr[0]) {
		//limits are index position 0 and 1
		var _min = _limits_arr[0];
		var _max = _limits_arr[1];
	} else {
		//string entries, so limits are 0 and size of the array -1
		var _min = 0;
		var _max = array_length(_limits_arr) - 1;
	}
	//move the selection
	_map_arr[@ 0] = clamp(_move + _map_arr[0], _min, _max);
	
}