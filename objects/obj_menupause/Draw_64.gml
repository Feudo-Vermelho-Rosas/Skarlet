// Desenhe a sprite do menu de pause. 
var _x = display_get_width();
var _y = display_get_height(); 
var _escala = 4;

draw_sprite_ext(spr_menupause, 0, _x/2, _y/2, _escala, _escala, 0, c_white, 1);