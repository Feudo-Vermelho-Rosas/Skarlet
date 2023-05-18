// Faça um efeito de fade in sempre quando houver troca de sala.
alpha -= 1/duracao;
if alpha <= 0 {
	alpha = 0;
}

draw_set_alpha(alpha) 
draw_rectangle_color(0,0,room_width,room_height,c_black,0,0,0,false);
draw_set_alpha(1);