// Faça a tela de gameover.
var _telawidth = display_get_gui_width();
var _telaheight = display_get_gui_height();

if alpha < 1 {
	alpha += alpha_add;
} else {
	alpha = 1;
}

if escala < 3 {
	escala += escala_add;
}

// Desenhe os retângulos.
draw_rectangle_color(0,0,_telawidth,y1_retangulo,c_black,c_black,c_black,c_black,false);
draw_rectangle_color(0,_telaheight,_telawidth,y2_retangulo,c_black,c_black,c_black,c_black,false);

y1_retangulo = lerp(y1_retangulo,(_telaheight+1)/2,0.005);
y2_retangulo = lerp(y2_retangulo,(_telaheight-1)/2,0.005);

// Desenhe o gameover.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu);
draw_text_transformed_color(_telawidth/2,_telaheight/2,"Game Over",escala,escala,0,
							c_white,c_white,c_white,c_white,alpha);

// Desenhe a mensagem.
if timer_gameover <= 0 {
	alpha_mensagem += alpha_add/3;
}

var _y = _telaheight - _telaheight/15;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu);
draw_text_transformed_color(_telawidth/2,_y,"Pressione Z para continuar",
							0.7,0.7,0,c_white,c_white,c_white,c_white,alpha_mensagem);


// Resete as configurações do draw
draw_set_color(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);