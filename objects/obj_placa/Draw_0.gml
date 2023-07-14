// Inherit the parent event
event_inherited();

// Distância de ativação.
if distance_to_object(obj_personagem) < distancia_ativar {
	// Indicador "!"
	draw_set_font(fnt_ajuda);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(x, y-12, "!",  1, c_black, 8, 100, 100);
}

