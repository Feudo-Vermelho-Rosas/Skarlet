//Verificar se o inventario esta ativo
inventario = false;
escala = 4;

///Pixel aonde que começa o inventario 
comeco_x = 19 * escala;
comeco_y = 38 * escala;

///Quantos espaços temos para inventario
slots_h = 7;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slot = 16 * escala;
buffer = 4 * escala;

inventario_l = sprite_get_width(spr_inventario) * escala;
inventario_a = sprite_get_height(spr_inventario) * escala;

item_selecionado = -1;
pos_selecionado = -1;

//Tudo que esta aqui vai inumera
enum Item_Armas{
	Cap,
	GarrafaComAgua,
	Garrafa,
	Espada,
	Altura // altura so para saber quantos item tem
}

enum Item_Inimigos{
	SlimeParte,
	OrcCapacete,
	OrcDente,
	Altura
}

///Identificar a coluna e linhas
//Modificar isso para ter so um Item para objs como espada etc..
enum Infos{
	Item,
	Quantidade,
	Sprite,
	Altura
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos.Altura - 1, total_slots - 1, -1);

ds_grid_add_item(Item_Armas.Espada, 1, spr_items_armas);
ds_grid_add_item(Item_Armas.Espada, 22, spr_items_armas);
ds_grid_add_item(Item_Armas.Cap, 8, spr_items_armas);
ds_grid_add_item(Item_Armas.Garrafa, 6, spr_items_armas);