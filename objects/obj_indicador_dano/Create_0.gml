// Pegue a escala do display
var _dw = display_get_gui_width();
var _dh = display_get_gui_height();

var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);

escala_x = _dw / _cw;
escala_y = _dh / _ch;

// Variáveis.
dano = 0;
x1 = 0;
y1 = 0;
alpha = 1;
