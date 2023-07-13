// Tenha uma chance pequena de dar moedas ao personagem.
if random_range(0,1) < chance_moedas {
	global.money += qntd_moedas;
	audio_play_sound(snd_loja,100,false);
}


