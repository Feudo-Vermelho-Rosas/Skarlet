// Adicione o xp ao jogador.
obj_personagem.xp += xp;

//Adicione dinheiro ao jogador.
global.money += reward;

// Crie o efeito de partícula.
instance_create_layer(x,y,"Instances",obj_particula_morte);

// Drop.
if id_drop != -1 {
	if random(1) < chance_drop {
		var _drop = instance_create_layer(x,y,"Instances",obj_item);
		_drop.image_index = id_drop;
		_drop.quantidade = quantidade;
	}
}
	
