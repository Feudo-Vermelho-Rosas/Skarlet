///Exibir se o jogo esta pausado

if(global.pause)
{
	///Escurecendo a tela
	draw_set_alpha(.6);
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	draw_set_color(c_black);
	draw_set_halign(1);
	draw_set_valign(1);
	
	draw_set_font(ft_menu);
	draw_text(display_get_width() / 2, display_get_height() / 2, "Paused");
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);	
}
