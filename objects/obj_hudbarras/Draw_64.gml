#region Personagem.
if instance_exists(obj_personagem) {
	#region Barra de vida.
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
	draw_set_font(fnt_menupause);
	
	var _string = string(_hp) + "/" + string(_max_hp) + " HP";
	draw_text_transformed(_x+100,_y-17,_string,_escala_texto,_escala_texto,0);

	// Resete o draw.
	draw_set_halign(-1);
	draw_set_font(-1);
	#endregion
	
	#region Barra de xp.
	var _altura_barra = sprite_get_height(spr_hud_xp)*_escala;
	var _comp_barra = sprite_get_width(spr_hud_xp)*_escala;
	
	var _telaaltura = display_get_gui_height();
	var _telacomprimento = display_get_gui_width();
	
	var _y = _telaaltura - _altura_barra;
	var _x = _telacomprimento/2 - _comp_barra/2;
	
	var _escala_x = (obj_personagem.xp / obj_personagem.max_xp) * _escala;
	
	// Desenhe o hud e a barra
	draw_sprite_ext(spr_barra_xp,0,_x+8,_y,_escala_x,_escala,0,c_white,1);
	draw_sprite_ext(spr_hud_xp,0,_x,_y,_escala,_escala,0,c_white,1);
	
	// Desenhe o texto
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_menupause);
	var _cor = #7AFFB6;
	
	var _string = string(obj_personagem.level);
	draw_text_outline(_telacomprimento/2,_y+2,_string,4,c_black,16,100,100);
	draw_text_color(_telacomprimento/2,_y+2,_string,_cor,_cor,_cor,_cor,1);
	
	// Resete o draw.
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_font(-1);
	#endregion
}
#endregion

#region Bosses.
if instance_exists(obj_boss_abelha) {
	// Hud e barra de vida.
	var _escala = 4;

	// Posições x e y.
	var _comp_hud = sprite_get_width(spr_hud_abelha_rainha);
	var _x_hud = display_get_gui_width()/2 - _comp_hud/2 * _escala;

	var _larg_hud = sprite_get_height(spr_hud_abelha_rainha);
	var _y_hud = (display_get_gui_height()) - _larg_hud * _escala;

	// Desenhe o hud.
	draw_sprite_ext(spr_hud_abelha_rainha,0,_x_hud,_y_hud,_escala,_escala,0,c_white,1);
	
	// Posições da barra.
	var _x_barra = _x_hud + 2*_escala;
	var _y_barra = _y_hud;
	
	// Escala da barra
	var _boss_hp = obj_boss_abelha.hp;
	var _maxboss_hp = obj_boss_abelha.max_hp;
	var _escala_x = _boss_hp / _maxboss_hp * _escala;
	
	// Desenhe a barra.
	draw_sprite_ext(spr_barra_abelha_rainha,0,_x_barra,_y_barra,_escala_x,_escala,0,c_white,1);
	
	// Desenhe o texto.
	var _escala_texto = 0.5;
	
	// Posição do texto.
	
	var _x_texto = display_get_gui_width()/2;
	var _y_texto = _y_hud+3;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_menupause);
	var _string = string(_boss_hp) + "/" + string(_maxboss_hp);
	draw_text_transformed(_x_texto,_y_texto,_string,_escala_texto,_escala_texto,0);

	// Resete o draw.
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_font(-1);
	
} else if instance_exists(obj_farao) {
	// Hud e barra de vida.
	var _escala = 4;

	// Posições x e y.
	var _comp_hud = sprite_get_width(spr_hud_farao);
	var _x_hud = display_get_gui_width()/2 - _comp_hud/2 * _escala;

	var _larg_hud = sprite_get_height(spr_hud_farao);
	var _y_hud = (display_get_gui_height()) - _larg_hud * _escala;

	// Desenhe o hud.
	draw_sprite_ext(spr_hud_farao,0,_x_hud,_y_hud,_escala,_escala,0,c_white,1);
	
	// Posições da barra.
	var _x_barra = _x_hud + 2*_escala;
	var _y_barra = _y_hud;
	
	// Escala da barra
	var _boss_hp = obj_farao.hp;
	var _maxboss_hp = obj_farao.max_hp;
	var _escala_x = _boss_hp / _maxboss_hp * _escala;
	
	// Desenhe a barra.
	draw_sprite_ext(spr_barra_farao,0,_x_barra,_y_barra,_escala_x,_escala,0,c_white,1);
	
	// Desenhe o texto.
	var _escala_texto = 0.5;
	
	// Posição do texto.
	
	var _x_texto = display_get_gui_width()/2;
	var _y_texto = _y_hud+3;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_font(fnt_menupause);
	var _string = string(_boss_hp) + "/" + string(_maxboss_hp);
	draw_text_transformed(_x_texto,_y_texto,_string,_escala_texto,_escala_texto,0);

	// Resete o draw.
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_font(-1);
}
#endregion

#region Moedas
if instance_exists(obj_personagem) {
	var _escala = 4;
	
	var _y = 130;
	var _x = 48;
	
	var _moedas = global.money;
	
	draw_sprite_ext(spr_moeda, 0, _x, _y, _escala, _escala, 0,c_white,1);
	
	// Desenhe o texto.
	var _escala_texto = 0.9;
	
	draw_set_halign(fa_left);
	draw_set_font(fnt_menupause);
	
	var _string =   "  X " + string(_moedas);
	draw_text_transformed(_x+30,_y-20,_string,_escala_texto,_escala_texto,0);
	
	// Resete o draw.
	draw_set_halign(-1);
	draw_set_font(-1);

}
#endregion

#region Indicador de poções.
if instance_exists(obj_personagem) {
	var _escala = 4;
	var _x = display_get_gui_width()-4;
	var _y = 4;
	
	var _posicao = 0;
	var _separacao = (sprite_get_height(spr_indicador_efeitos)+1) * _escala;
	
	if global.alarme_cura_delay > 0 {
		draw_sprite_ext(spr_indicador_efeitos, 0, _x, _y,
						_escala, _escala, 0, c_white, 1);
		_posicao++;
	}
	if global.alarme_forca_duracao > 0 {
		draw_sprite_ext(spr_indicador_efeitos, 1, _x, _y+_separacao*_posicao,
						_escala, _escala, 0, c_white, 1);
		_posicao++;
	}
	if global.alarme_velocidade_duracao > 0 {
		draw_sprite_ext(spr_indicador_efeitos, 2, _x, _y+_separacao*_posicao,
						_escala, _escala, 0, c_white, 1);
		_posicao++;
	}
	if global.alarme_defesa_duracao > 0 {
		draw_sprite_ext(spr_indicador_efeitos, 3, _x, _y+_separacao*_posicao,
						_escala, _escala, 0, c_white, 1);
		_posicao++;
	}
	
}

#endregion