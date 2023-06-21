// Posione o indicador corretamente
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

var _x = (x1 - _cx) * escala_x;
var _y = (y1 - _cy) * escala_y;

draw_set_color(c_red);
draw_set_alpha(alpha);
draw_set_font(ft_menupause);
draw_text_color(_x,_y-40,string(cura),c_lime,c_lime,c_lime,c_lime,1);

// Resete as configurações de draw.
draw_set_color(-1);
draw_set_font(-1);
draw_set_alpha(1);


