// Desenhe a sprite do menu de pause. 
var _x = display_get_gui_width();
var _y = display_get_gui_height(); 
var _escala = 4;
var _cor = #683E0E;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_ext(spr_menupause, 0, _x/2, _y/2, _escala, _escala, 0, c_white, 1);

draw_set_font(fnt_menu);


// linha de espaços
var _gap = 70;

//draw items
for (var i = 0; i < array_length(menu[sub_menu]); ++i) {
	draw_set_color(c_black);
	if i == index draw_set_color(c_red)
	
	//is this a selectable menu item, or just plain tet?
	if is_array(menu[sub_menu][i]){
		//store menu array
		var _menu_arr = menu[sub_menu][i];
		
		//get the map array
		var _map_arr = setpause[? _menu_arr[1]];
		
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
		
	draw_text(_x/2, ((_y/2)-70) + _gap*i, _str);
    //draw_text_outline(_x/2, ((_y/2)- 70) + _gap *i, _str, 4, c_black, 16, 1000, 1000);

}

// Resete as configurações de draw.
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
