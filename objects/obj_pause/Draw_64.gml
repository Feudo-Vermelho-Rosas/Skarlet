///Exibir se o jogo esta pausado

if(global.pause)
{
	var _x = display_get_width();
	var _y = display_get_height();
	
	///Escurecendo a tela
	draw_set_alpha(.6);
	draw_rectangle_color(0, 0, _x, _y, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	draw_set_color(c_black);
	draw_set_halign(1);
	draw_set_valign(1);
	
	draw_set_font(ft_menu); 
	draw_text(_x/2, _y/3, "Paused");
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
	// Crie uma instância do menu de pause caso uma já não exista.
	if !instance_exists(obj_menupause) {
		instance_create_depth(0,0,-1,obj_menupause);
	} 
}
