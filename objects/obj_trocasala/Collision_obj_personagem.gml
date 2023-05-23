// Faça a mudança de room.
if ativo {
	switch room {
		case rm_floresta_andar_4:
			room_goto_next();
			obj_personagem.x = 336;
			obj_personagem.y = 436;
			break;
		default:
			room_goto_next();
			obj_personagem.x = 336;
			obj_personagem.y = 336;
			break;
	}
}