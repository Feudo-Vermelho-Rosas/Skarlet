// Desenhe a sombra
draw_sprite(spr_sombra_media,0,x,y+8);

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

// Desenhe a barra de vida
if alarme_barra_vida > 0 {
	draw_sprite(spr_hud_inimigo,0,x,y-7);
	draw_sprite_ext(spr_barra_inimigo,0,x-5,y-5,hp/max_hp,1,0,c_white,1);
	alarme_barra_vida -= 1;
}

// Resete as configurações de desenho.
gpu_set_fog(false,c_red,0,0);