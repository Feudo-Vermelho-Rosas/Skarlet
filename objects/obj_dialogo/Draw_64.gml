 // Desenhe a caixa de diálogo.
 var _x = display_get_gui_width()/2;
 var _y = display_get_gui_height()/2;
 var _escala = 4;
 
 draw_sprite_ext(spr_diagolo,0,_x,_y,_escala,_escala,0,c_white,1);
 
 // Desenhe o texto.
 var _sprite_comp = sprite_get_width(spr_diagolo);
 var _sprite_lar = sprite_get_height(spr_diagolo);
 
 var _x = _x - _sprite_comp*_escala/2 + 80;
 var _y = _y - _sprite_lar*_escala/2 + 36;
 
draw_set_font(fnt_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_ext(_x,_y,_string,64,750);

// Resete os draws.
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(-1);
 