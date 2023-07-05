// Desenhe na tela "debug active" se o debug estiver ativado.
if active {
	var _x = display_get_gui_width()/2;
	var _y = 0;
	
	draw_set_font(fnt_inv);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_red);
	
	draw_text(_x,_y,"debug active");
	
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
}
