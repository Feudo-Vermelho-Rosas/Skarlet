 ///main menu

#macro MAIN			0
#macro SETTINGS		1
#macro CONTROLES	2

global.dsm_settings = ds_map_create();
#macro set		global.dsm_settings

var _ajuda;
if (global.ajuda == true) _ajuda = 0 else _ajuda = 1;

ds_map_add(set, "som", [global.volume_geral*10, [0, 10]]);
ds_map_add(set, "musica", [global.volume_musica*10, [0, 10]]);
ds_map_add(set, "ajuda", [_ajuda, ["Ligada", "Desligada"]]);

time_held_right = 0;
time_held_left = 0;

menu[MAIN][0] = "Novo Jogo";
menu[MAIN][1] = "Opções";
menu[MAIN][2] = "Sair";

//options submenu 1
menu[SETTINGS][0] = ["Som: ", "som"];
menu[SETTINGS][1] = ["Musica: ", "musica"];
menu[SETTINGS][2] = "Controles";
menu[SETTINGS][3] = ["Ajuda: ", "ajuda"];
menu[SETTINGS][4] = "Voltar";

//options submenu2
menu[CONTROLES][0] = "Voltar";


index = 0;    //Menu index position
sub_menu = 0; //current menu