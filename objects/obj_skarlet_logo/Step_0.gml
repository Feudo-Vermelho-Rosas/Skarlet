// Efeito de mudança de escala.

if escala < 0.95 {
	add_escala = 0.0001;
} else if escala > 1.05 {
	add_escala = -0.0001;
}

escala += add_escala;

image_xscale = escala;
image_yscale = escala;

// Efeito de rotação.

if rotacao > 5 {
	add_rotacao = -0.01;
} else if rotacao < -5 {
	add_rotacao = 0.01;
}

rotacao += add_rotacao;

image_angle = rotacao;