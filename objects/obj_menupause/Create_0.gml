 ///main menupause

#macro MAINPAUSE			0
#macro SETTINGSPAUSE		1

global.dsm_settings = ds_map_create();
#macro setpause		global.dsm_settings

ds_map_add(setpause, "som", [global.volume_geral, [0, 10]]);
ds_map_add(setpause, "musica", [global.volume_musica, [0, 10]]);

time_held_right = 0;
time_held_left = 0;

menu[MAINPAUSE][0] = "Continuar";
menu[MAINPAUSE][1] = "Opções";
menu[MAINPAUSE][2] = "Salvar/Sair";

//options submenu 1
menu[SETTINGSPAUSE][0] = ["Som: ", "som"];
menu[SETTINGSPAUSE][1] = ["Musica: ", "musica"];
menu[SETTINGSPAUSE][2] = "Voltar";

index = 0;   //Menu index position
sub_menu = 0; //current menu
