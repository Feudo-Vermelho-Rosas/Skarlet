var _x = display_get_gui_width();
var _y = display_get_gui_height();
var _esc = 4;

if (global.controles == true){
		draw_sprite_ext(spr_controles, 0, (_x + 170) / 2, _y / 2 , _esc, _esc, 0, c_white, 1);
	}