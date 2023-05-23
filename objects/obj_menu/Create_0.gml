 ///main menu

#macro MAIN			0
#macro SETTINGS		1

global.dsm_settings = ds_map_create();
#macro set		global.dsm_settings

ds_map_add(set, "som", [global.volume_geral, [0, 10]]);
ds_map_add(set, "musica", [global.volume_musica, [0, 10]]);
ds_map_add(set, "controles", [0, ["Teclado", "Joystick"]]);

time_held_right = 0;
time_held_left = 0;

menu[MAIN][0] = "Novo Jogo";
menu[MAIN][1] = "Opções";
menu[MAIN][2] = "Sair";

//options submenu 1
menu[SETTINGS][0] = ["Som: ", "som"];
menu[SETTINGS][1] = ["Musica: ", "musica"];
menu[SETTINGS][2] = ["Controle: ", "controles"];
menu[SETTINGS][3] = "Voltar";

index = 0;    //Menu index position
sub_menu = 0; //current menu