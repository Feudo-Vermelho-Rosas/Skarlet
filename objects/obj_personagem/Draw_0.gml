// Desenhe a sombra
draw_sprite(spr_sombra_media,0,x,y+y_sombra); 

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

// Desenhe a si próprio.
draw_self();

// Resete as configurações de desenho.
gpu_set_fog(false,c_red,0,0);

