instance_deactivate_all(obj_creditos);	
draw_set_font(fnt_menu);
draw_set_color(c_white);
draw_set_halign(fa_center);

for (var i = 0; i < array_length_1d(creditos); i++) {
    var _credit = creditos[i];
    draw_text(room_width / 2, y_pos + (i * 140), _credit);
}

y_pos -= scroll_speed;

if (y_pos < -array_length_1d(creditos) * 140) {
    game_restart();
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);