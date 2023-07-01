#region Inventário.

// Profundidade.
depth = -5000;

//Verificar se o inventario esta ativo
inventario = false;
escala = 4;

///Pixel aonde que começa o inventario 
comeco_x = 19 * escala;
comeco_y = 40 * escala;

///Quantos espaços temos para inventario
slots_h = 7;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slot = 16 * escala;
bufferx = 4 * escala;
buffery = 5 * escala;

inventario_l = sprite_get_width(spr_inventario) * escala;
inventario_a = sprite_get_height(spr_inventario) * escala;

item_selecionado = -1;
pos_selecionado = -1;

// Começo não agrupáveis.
id_nao_agrupaveis = 6; 

//Tudo que está aqui vai enumerar.
enum Itens{
	PocaoRegen,
	PocaoForca,
	PocaoDefesa,
	PocaoVelocidade,
	FavoMel,
	RosaLaranja,
	CruzFarao,
	RosaVermelha,
	EspadaPadrao,
	EspadaMadeira,
	EspadaFavo,
	EspadaCacto,
	Khopesh,
	ArmaduraPadrao,
	ArmaduraFavo,
	ArmaduraMadeira,
	ArmaduraCacto,
	ArmaduraFarao,
	Altura // altura so para saber quantos item tem
}

// Identificar a coluna e linhas
// Modificar isso para ter so um Item para objs como espada etc.
enum Infos{
	Item,
	Quantidade,
	Sprite,
	Altura
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos.Altura - 1, total_slots - 1, -1);

ds_grid_add_item(Itens.PocaoRegen, 10, spr_items_armas);
ds_grid_add_item(Itens.ArmaduraMadeira, 1, spr_items_armas);
ds_grid_add_item(Itens.EspadaMadeira, 1, spr_items_armas);
ds_grid_add_item(Itens.PocaoForca, 1, spr_items_armas);
ds_grid_add_item(Itens.PocaoVelocidade, 1, spr_items_armas);
ds_grid_add_item(Itens.PocaoDefesa, 1, spr_items_armas);

#endregion

#region Equips.

	// Pixel aonde que começa o inventário.
	comeco_equips_x = 174 * escala;
	comeco_equips_y = 60 * escala;

	// Quantos espaços temos para inventário.
	slots_equips_h = 2;
	slots_equips_v = 1;
	
	// Grid dos equips.
	grid_equips = ds_grid_create(Infos.Altura, 2);
	ds_grid_set_region(grid_equips, 0, 0, Infos.Altura - 1, 2 - 1, -1);

	ds_grid_add_equip(Itens.EspadaPadrao, 1, spr_items_armas);
	ds_grid_add_equip(Itens.ArmaduraPadrao, 1, spr_items_armas);
	
	// Pixel onde começa os dados
	comeco_dados_x = 177 * escala ;
	comeco_dados_y = 88 * escala;
	espacamento = 15 * escala;

#endregion

#region Timers.
global.alarme_cura_delay = 0;
duracao_cura_delay = 1800;
global.alarme_forca_duracao = 0;
duracao_forca = 1800;
global.alarme_defesa_duracao = 0;
duracao_defesa = 1800;
global.alarme_velocidade_duracao = 0;
duracao_velocidade = 1800;
#endregion