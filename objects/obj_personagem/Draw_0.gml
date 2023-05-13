/// @description

// Efeito de invulnerabilidade.
if invulneravel {
	scr_efeito_invulneravel();
} else {
	image_alpha = 1;
}

// Efeito de hit
if hit_alarme > 0 {
	gpu_set_fog(true,c_red,0,0);
}

// HP
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(ft_menu);
draw_text_transformed(x,y-10,string(hp),0.2,0.2,0);

// Desenhe a si próprio.
draw_self();

// Resete as configurações de desenho.
gpu_set_fog(false,c_red,0,0);