///Exibir se o jogo esta pausado

if(global.pause)
{
	var _x = display_get_gui_width();
	var _y = display_get_gui_height();
	
	///Escurecendo a tela
	draw_set_alpha(.6);
	draw_rectangle_color(0, 0, _x, _y, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	// Resete as configurações do draw
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
}
