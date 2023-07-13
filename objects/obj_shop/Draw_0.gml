// Desenhe a si mesmo.
draw_sprite(spr_sombra_media,0,x,y+y_sombra);
draw_self();

// Indicador de preço.
var _str_preco = string(price);
draw_set_font(fnt_ajuda);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outline(x, y-10, _str_preco,  1, c_black, 8, 100, 100);

// Indicador de quantidade.

var _str_qntd = string(quantidade);
draw_set_font(fnt_ajuda);
draw_set_color(c_aqua);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outline(x, y+7, _str_qntd,  1, c_black, 8, 100, 100);

draw_set_font(-1);
draw_set_color(-1);
draw_set_halign(-1);
draw_set_valign(-1);