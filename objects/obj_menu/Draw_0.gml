draw_set_halign(fa_left);
draw_set_font(fnt_menu);

///line spacing
var _gap = 55;

//draw items
for (var i = 0; i < array_length(menu[sub_menu]); ++i) {
	draw_set_color(c_white);
	if i == index draw_set_color(c_red)
	
	//is this a selectable menu item, or just plain text?
	if is_array(menu[sub_menu][i]){
		//store menu array
		var _menu_arr = menu[sub_menu][i];
		
		//get the map array
		var _map_arr = set[? _menu_arr[1]];
		
		//get the limit array, or choices array
		var _limits_arr = _map_arr[1];
		
		//do we show an integer or text?
		if is_real(_limits_arr[0]) {
			//integer to show
			var _str = _menu_arr[0] + string(_map_arr[0]);
		}else {
			//string to show
			var _str = _menu_arr[0] + _limits_arr[_map_arr[0]];
		}
	
	}else{
		//draw string
		var _str = menu[sub_menu][i];
	}
	
	
	// Desenhe o texto com outline.
	var _x = room_width/15;
	var _y = room_height/2 - (_gap*array_length(menu[sub_menu])/2) + _gap*i
	
    //draw_text(room_width/15, room_height/2 + _gap *i, _str);
	draw_text_outline(_x, _y, _str, 4, c_black, 16, 10, 10000)
}