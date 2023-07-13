instance_deactivate_all(obj_creditos);	
draw_set_font(fnt_creditos);
draw_set_color(c_white);
draw_set_halign(fa_center);
var _esc = 1;

for (var i = 0; i < array_length_1d(creditos); i++) {
    var _credit = creditos[i];
    draw_text(room_width/2, y_pos + (i * 140), _credit);
	draw_sprite_ext(spr_skarlet_logo, 0, room_width / 2, y_pos, _esc, _esc, 0, c_white, 1);
}

y_pos -= scroll_speed;

if (y_pos < -array_length_1d(creditos) * 140) {
    game_restart();
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);