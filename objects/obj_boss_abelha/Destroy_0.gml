// Adicione o xp ao jogador.
obj_personagem.xp += xp;

audio_sound_gain(global.musica_bg,0,2000);

// Crie as partículas.
repeat(30) {
	var _x = x + irandom_range(-30, 30);
	var _y = y + irandom_range(-25, 5);
	instance_create_layer(_x,_y,"Instances",obj_particula_morte);
}

// Drops.
var _x = x + irandom_range(-10,10);
var _y = y + irandom_range(-10,10);

var _drop_1 = instance_create_layer(_x,_y,"Instances",obj_item);
_drop_1.image_index = id_drop_1;
_drop_1.quantidade = quantidade_1;

_x = x + irandom_range(-10,10);
_y = y + irandom_range(-10,10);

var _drop_2 = instance_create_layer(_x,_y,"Instances",obj_item);
_drop_2.image_index = id_drop_2;
_drop_2.quantidade = quantidade_2;

_x = x + irandom_range(-10,10);
_y = y + irandom_range(-10,10);

var _drop_3 = instance_create_layer(_x,_y,"Instances",obj_item);
_drop_3.image_index = id_drop_3;
_drop_3.quantidade = quantidade_3;