// Desenhe a sombra
draw_sprite(spr_sombra_boss,0,x,y+32);

// Desenhe a si próprio.
draw_self();

// Resete as configurações de desenho.
gpu_set_fog(false,c_red,0,0);