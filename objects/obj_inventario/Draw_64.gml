var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


if inventario == true{
	
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2;
	
	// Desenhe o hud do inventário.
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	#region Equips.
	// Parte do equipamento e das armas.
	var ix = 0;
	var iy = 0;
	
	for(var i = 0; i < 2; i++){
		
		var _slotsx = _invx + comeco_equips_x + ((tamanho_slot + bufferx) * ix);
		var _slotsy = _invy + comeco_equips_y + ((tamanho_slot + buffery) * iy);
		
		// Desenhe os itens.
		draw_item(grid_equips, i, _slotsx, _slotsy);
		
		ix++;
	}
	
	// Desenhe a gui de equips.
	draw_gui_equips(_invx, _invy);
	
	#endregion
	
	#region Inventário.
	// Inventário em si.
	var ix = 0;
	var iy = 0;
	
	for(var i = 0; i < total_slots; i++){
		var _slotsx = _invx + comeco_x + ((tamanho_slot + bufferx) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slot + buffery) * iy);
		
		// Desenhe os itens.
		draw_item(grid_items, i, _slotsx, _slotsy);
		
		// Faça o controle de seleção e interação com o mouse.
		controle_selecao(i,_mx,_my,_slotsx,_slotsy);
		
		// Controle do loop.
		ix++;
		if ix >= slots_h{
			ix = 0;
			iy++;
		}
	}
	
	// 
	var ix = 0;
	var iy = 0;
	for (var i = 0; i < total_slots; i++) {
		
		var _slotsx = _invx + comeco_x + ((tamanho_slot + bufferx) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slot + buffery) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy + tamanho_slot) {
			draw_nome_item(grid_items[# Infos.Item, i]);
		}
		
		ix++;
		if ix >= slots_h{
			ix = 0;
			iy++;
		}
	}
	
	#endregion

}

