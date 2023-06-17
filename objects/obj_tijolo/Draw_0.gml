// Desenhe a si mesmo
draw_sprite(sprite,0,x,y);

// Desenhe a sombra.
y_sombra = y + y_queda - y_percorrido;
draw_sprite(sombra,0,x,y_sombra);


