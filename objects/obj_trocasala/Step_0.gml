// Ative o altar quando não tiver inimigos na sala.
if instance_number(obj_inimigo) > 0 or instance_number(obj_boss) > 0 {
	ativo = false;
	visible = false;
} else {
	ativo = true;
	visible = true;
}
