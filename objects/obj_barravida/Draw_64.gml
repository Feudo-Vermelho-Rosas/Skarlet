#region Personagem.
if instance_exists(obj_personagem) {
	// Barra de vida do personagem.
	var _escala = 4;
	var _altura_barra = sprite_get_height(spr_hud_vida) * _escala;

	var _y = _altura_barra/2 + 4;
	var _x = 4;

	var _hp = obj_personagem.hp;
	var _max_hp = obj_personagem.max_hp;

	// Desenhe o hud e a barra.
	draw_sprite_ext(spr_hud_vida,0,_x,_y,_escala,_escala,0,c_white,1);
	draw_sprite_ext(spr_barra_vida,0,_x+92,_y,(_hp/_max_hp)*_escala,_escala,0,c_white,1);

	// Desenhe o texto.
	var _escala_texto = 0.7;

	draw_set_halign(fa_left);
	draw_set_font(ft_menupause);
	var _string = string(_hp) + "/" + string(_max_hp) + " HP";
	draw_text_transformed(_x+100,_y-17,_string,_escala_texto,_escala_texto,0);

	// Resete o draw.
	draw_set_halign(-1);
	draw_set_font(-1);
}
#endregion

#region Bosses.
if instance_exists(obj_boss) {
	// Hud e barra de vida.
	var _escala = 4;

	// Posições x e y.
	var _comp_hud = sprite_get_width(spr_hud_abelha_rainha);
	var _x_hud = display_get_gui_width()/2 - _comp_hud/2 * _escala;

	var _larg_hud = sprite_get_height(spr_hud_abelha_rainha);
	var _y_hud = (display_get_gui_height()) - _larg_hud/2 * _escala;

	// Desenhe o hud.
	draw_sprite_ext(spr_hud_abelha_rainha,0,_x_hud,_y_hud,_escala,_escala,0,c_white,1);
	
	// Posições da barra.
	var _x_barra = _x_hud + 2*_escala;
	var _y_barra = _y_hud;
	
	// Escala da barra
	var _boss_hp = obj_boss.hp;
	var _maxboss_hp = obj_boss.max_hp;
	var _escala_x = _boss_hp / _maxboss_hp * _escala;
	
	// Desenhe a barra.
	draw_sprite_ext(spr_barra_abelha_rainha,0,_x_barra,_y_barra,_escala_x,_escala,0,c_white,1);
	
	// Desenhe o texto.
	var _escala_texto = 0.5;
	
	// Posição do texto.
	
	var _x_texto = display_get_gui_width()/2-17;
	var _y_texto = _y_hud-10;
	
	draw_set_halign(fa_left);
	draw_set_font(ft_menupause);
	var _string = string(_boss_hp) + "/" + string(_maxboss_hp);
	draw_text_transformed(_x_texto,_y_texto,_string,_escala_texto,_escala_texto,0);

	// Resete o draw.
	draw_set_halign(-1);
	draw_set_font(-1);
}
#endregion