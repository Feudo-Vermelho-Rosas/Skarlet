// Mude de direção quando alguma das bordas do sprite atingir o canto da tela.
if bbox_right < room_width {
	veloc = -veloc;
} else if bbox_left > 0 {
	veloc = -veloc;
}

// Adicione a velocidade à posição.
x += veloc;

