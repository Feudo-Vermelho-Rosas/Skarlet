// Geral.
function scr_boss_criacao() {
	// Estado de criação do boss.
	
	if image_alpha >= 1 {
		alpha_add = -0.1;	
	} else if image_alpha <= 0 {
		alpha_add = 0.1;
	}
	
	image_alpha += alpha_add;
	
	if alarme_spawn > 0 {
		alarme_spawn -= 1;
	} else {
		image_alpha = 1;
	}
	
	if alarme_spawn > 0 {
		alarme_spawn -= 1;
	} else {
		estado = escolha;
	}
}

// Abelha.
function scr_abelha_escolha() {
	// Estado de escolha da abelha.
	
	if alarme_cooldown > 0 {
		alarme_cooldown -= 1;
	} else {
		// Escolha o próximo ataque.
		proximo_estado = choose(scr_boss_abelha_ferroes, scr_boss_abelha_avanco, scr_boss_abelha_abelhas);
	
		if proximo_estado == scr_boss_abelha_ferroes {
			dest_x = x;
			dest_y = y;
			tempo = 0;
			estado = scr_boss_abelha_ferroes;
			alarme_ferroes = duracao_ferroes;
		} else if proximo_estado == scr_boss_abelha_avanco {
			estado = scr_boss_abelha_avanco;
			repeticao_rush = 0;
		} else if proximo_estado == scr_boss_abelha_abelhas {
			// Spawne 3 abelhas pequenas.
			repeat(qntd_spawn_abelhas){
				var _x;
				var _y;
				
				while true {
					_x = x + irandom_range(-20,20);
					_y = y + irandom_range(-20,20);
					
					// Evite spawn em alguma hitbox.
					var _colisao = place_meeting(_x,_y,obj_parede);
					if _colisao == false {
						break;
					}
				}
				
				instance_create_layer(_x,_y,"Instances",obj_abelhaboss);
				instance_create_layer(_x,_y,"Instances",obj_particula_morte);
			}
			estado = scr_boss_abelha_abelhas;
			alarme_abelhas = duracao_abelhas;
		}
	}
	
}

function scr_boss_abelha_avanco() {
	// Estado de ataque avanço da abelha.
	
	if alarme_cooldown > 0 {
		alarme_cooldown -= 1;
	} else {
		if repeticao_rush < 3 {
			dest_x = obj_personagem.x;
			dest_y = obj_personagem.y;
			veloc_dir = point_direction(x,y,dest_x,dest_y);
			estado = scr_boss_abelha_rush;
		} else {
			estado = scr_abelha_escolha;
			alarme_cooldown = duracao_cooldown;
		}
	}
}

function scr_boss_abelha_rush() {
	// Ataque de rush da abelha.
	
	var _dir_atualizada = point_direction(x,y,dest_x,dest_y)
	
	hveloc = lengthdir_x(veloc_avanco, veloc_dir);
	vveloc = lengthdir_y(veloc_avanco, veloc_dir);
	
	x += hveloc;
	y += vveloc;
	
	// Pare o avanço assim que chegar ao destino.
	if (round(_dir_atualizada) == round(veloc_dir-180) or
		round(_dir_atualizada) == round(veloc_dir+180)) or (x == dest_x and y == dest_y) {
		estado = scr_boss_abelha_avanco;
		alarme_cooldown = duracao_cooldown;
		repeticao_rush += 1;
	}
	
}

function scr_boss_abelha_abelhas() {
	// Estado de ataque em que a abelha spawna outras abelhinhas.
	
	if alarme_abelhas > 0 {
		alarme_abelhas -= 1;
	} else {
		estado = scr_abelha_escolha;
		alarme_cooldown = duracao_cooldown;
	}
}

function scr_boss_abelha_ferroes() {
	// Estado de ataque de ferrões da abelha.
	
	// Movimento.
	var _raio = 32;
	
	x = _raio*sin(4*pi*tempo/duracao_ferroes) + dest_x;
	y = _raio*cos(4*pi*tempo/duracao_ferroes)-_raio + dest_y;
	
	// Spawn dos projéteis.
	if alarme_spawn_ferroes > 0 {
		alarme_spawn_ferroes -= 1;
	} else {
		alarme_spawn_ferroes = duracao_spawn_ferroes;
		instance_create_layer(x,y-8,"Instances",obj_ferrao);
	}
	
	// Verifique o alarme.
	if alarme_ferroes > 0 {
		alarme_ferroes -= 1;
		tempo += 1;
	} else {
		estado = scr_abelha_escolha;
		alarme_cooldown = duracao_cooldown;
	}
	
}
	
function scr_boss_abelha_controle_sprite() {
	// Faz o controle de sprites do boss da abelha.
	
	direcao = point_direction(x,y,obj_personagem.x,obj_personagem.y);
	
	if direcao >= 270 or direcao <= 90 {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}
	
	if estado == scr_boss_abelha_rush {
		sprite_index = sprite_avancando;
	} else {
		sprite_index = sprite_parado;
	}
}
	
function scr_boss_abelha_hit() {
	
	// Cheque o alarme de hit.
	if alarme_hit > 0 {
		alarme_hit -= 1;
	} else {
		estado = scr_abelha_escolha;
		alarme_cooldown = duracao_cooldown;
	}
	
}
	
function scr_boss_controle_hp() {
	// Cheque o HP.
	if hp < max_hp/3 and rage == false {
	
		// Modo de rage.
		rage = true;
		sprite_avancando = spr_boss_abelha_rage_avanco;
		sprite_parado = spr_boss_abelha_rage_parada;
	
		veloc_avanco *= 1.5;
		veloc *= 2;
	
		qntd_spawn_abelhas = 5;
	
		duracao_cooldown /= 2;
		duracao_ferroes /= 2;
		duracao_spawn_ferroes /= 2;
	
	} else if hp <= 0 { // Delete a instância se o HP chegar a 0.
		instance_destroy();
	}
}

// Faraó.
function scr_boss_farao_escolha() {
	// Estado de escolha do faraó.
	if alarme_cooldown > 0 {
		alarme_cooldown -= 1;
	} else {
		// Escolha o próximo.
		proximo_estado = choose(scr_boss_farao_mumias, scr_boss_farao_head, 
								scr_boss_farao_tijolos, scr_boss_farao_maldicao,
								);
		atacando = true;
		audio_play_sound(snd_farao_spell,10,0);
		image_index = 0;
		
		if proximo_estado == scr_boss_farao_mumias {
			// Spawne 4 múmias.
			repeat(qntd_spawn_mumias) {
				var _x;
				var _y;
				
				while (true) {
					_x = x + irandom_range(-200,200);
					_y = y + irandom_range(-200,200);
					
					// Evite o spawn em hitbox e fora da tela.
					var _colisao = place_meeting(_x-8,_y-8,obj_parede) or place_meeting(_x+8,_y+8,obj_parede);
					var _na_tela_x = ((_x > 74) and (_x < room_width-74));
					var _na_tela_y = ((_y > 74) and (_y < room_height-74));
					
					if (!_colisao and _na_tela_x and _na_tela_y) break;
					
				}
				
				instance_create_layer(_x,_y,"Instances",obj_mumia);
				instance_create_layer(_x,_y,"Instances",obj_particula_morte);
				
				estado = scr_boss_farao_mumias;
				alarme_mumias = duracao_mumias;
			}
			
		} else if proximo_estado == scr_boss_farao_head {
			// Spawne a head.
			instance_create_layer(x,y-50,"Instances",obj_farao_head);
			
			estado = scr_boss_farao_head;
			alarme_head = duracao_head;
			
		} else if proximo_estado == scr_boss_farao_tijolos {
			// Spawne tijolos em cima do personagem.
			repeat(qntd_tijolos) {
				var _tijolo = instance_create_layer(0,0,"Instances",obj_tijolo);
				_tijolo.x += irandom_range(32,-32);
				_tijolo.y += irandom_range(16,-16);
				
				estado = scr_boss_farao_tijolos;
				alarme_tijolos = duracao_tijolos;
			}
		} else if proximo_estado == scr_boss_farao_maldicao {
			// Spawne uma região de maldição
			
			repeat(qntd_maldicao) {
				// Pegue uma posição válida.
				while (true) {
					_x = x + irandom_range(-64,64);
					_y = y + irandom_range(-64,64);
					
					// Evite o spawn em hitbox e fora da tela.
					var _colisao = place_meeting(_x-8,_y-8,obj_parede) or place_meeting(_x+8,_y+8,obj_parede);
					var _na_tela_x = ((_x > 74) and (_x < room_width-74));
					var _na_tela_y = ((_y > 74) and (_y < room_height-74));
					
					if (!_colisao and _na_tela_x and _na_tela_y) break;
					
				}
				
				instance_create_layer(_x,_y,"Instances",obj_maldicao);
				
				estado = scr_boss_farao_maldicao;
				alarme_maldicao = duracao_maldicao;
			}
		}
		
	}
	
}

function scr_boss_farao_head() {
	// O Faraó solta um projétil no formato da parte de cima de seu cajado.
	
	if alarme_head > 0 {
		alarme_head -= 1;
	} else {
		estado = scr_boss_farao_escolha;
		alarme_cooldown = duracao_cooldown;
	}
}

function scr_boss_farao_mumias() {
	// Estado que o faraó spawna mumias.
	
	if alarme_mumias > 0 {
		alarme_mumias -= 1;
	} else {
		estado = scr_boss_farao_escolha;
		alarme_cooldown = duracao_cooldown;
	}
}
	
function scr_boss_farao_tijolos() {
	// Estado do ataque de tijolos.
	
	if alarme_tijolos > 0 {
		alarme_tijolos -= 1;
	} else {
		estado = scr_boss_farao_escolha;
		alarme_cooldown = duracao_cooldown;
	}
	
}
	
function scr_boss_farao_maldicao() {
	// Estado de ataque de maldição.
	
	if alarme_maldicao > 0 {
		alarme_maldicao -= 1;
	} else {
		estado = scr_boss_farao_escolha;
		alarme_cooldown = duracao_cooldown;
	}
}
	
function scr_boss_farao_controle_sprite() {
	// Faz o controle de sprites do boss faraó.
	
	var _sprite_lado = sprite_parado_lado;
	var _sprite_frente = sprite_parado_frente;
	var _sprite_costas = sprite_parado_costas;
	
	// Se ele estiver em estado de ataque, mude os sprites.
	if atacando {
	
		var _sprite_lado = sprite_atacando_lado;
		var _sprite_frente = sprite_atacando_frente;
		var _sprite_costas = sprite_atacando_costas;
		
	}
	
	direcao = point_direction(x,y,obj_personagem.x,obj_personagem.y);
	
	if direcao >= 315 or direcao < 45 {
		image_xscale = 1;
		sprite_index = _sprite_lado;
	} else if direcao >= 45 and direcao < 135 {
		image_xscale = 1;
		sprite_index = _sprite_costas;
	} else if direcao >= 135 and direcao < 225 {
		image_xscale = -1;
		sprite_index = _sprite_lado;
	} else {
		image_xscale = 1;
		sprite_index = _sprite_frente;
	}
	
	if (image_index >= image_number-1) atacando = false;
	
}

function scr_boss_farao_hit() {
	
	// Cheque o alarme de hit.
	if alarme_hit > 0 {
		alarme_hit -= 1;
	} else {
		estado = scr_boss_farao_escolha;
		alarme_cooldown = duracao_cooldown;
	}
}
	
function scr_boss_farao_controle_hp() {
	// Cheque o HP.
	if hp < max_hp/3 and rage == false {
	
		// Modo de rage.
		rage = true;
		sprite_parado_frente = spr_boss_farao_rage_parado_frente;
		sprite_parado_costas = spr_boss_farao_rage_costas_parado;
		sprite_parado_lado = spr_boss_farao_rage_parado_lado;
		sprite_atacando_frente = spr_boss_farao_rage_ataque_frente;
		sprite_atacando_costas = spr_boss_farao_rage_ataque_costas;
		sprite_atacando_lado = spr_boss_farao_rage_ataque_lado;
	
	
		qntd_spawn_mumias = 3;
		qntd_tijolos = 8;
		qntd_maldicao = 15;
		
		duracao_cooldown /= 2;
		duracao_mumias /= 2;
		duracao_head /= 2;
		duracao_tijolos /= 2;
	
	} else if hp <= 0 { // Delete a instância se o HP chegar a 0.
		instance_destroy();
	}
}
	