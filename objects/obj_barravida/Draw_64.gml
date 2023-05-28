// Barra de vida.
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