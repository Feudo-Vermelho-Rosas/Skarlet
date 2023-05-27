// Desenhe a sombra
draw_sprite(spr_sombra_boss,0,x,y+16);

// Efeito de invulnerabilidade.
if invulneravel {
	scr_efeito_invulneravel();
} else if estado != scr_boss_criacao {
	image_alpha = 1;
}

// Efeito de hit
if alarme_hit> 0 {
	gpu_set_fog(true,c_red,0,0);
}

// Desenhe a si próprio.
draw_self();

// Resete as configurações de desenho.
gpu_set_fog(false,c_red,0,0);