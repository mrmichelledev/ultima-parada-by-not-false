// Coordenadas do mouse
var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)


draw_set_font(fMenu)
draw_set_halign(fa_right)
draw_set_valign(fa_middle)

var tam_menu = array_length(menu_inicial)

for(var i = 0; i < tam_menu; i++){
	
	var _larg_gui = display_get_gui_width()
	var _alt_gui = display_get_gui_height()
	
	
	var _alt_texto = string_height("I")
	var _larg_texto = string_width(menu_inicial[i])
	
	// 1. ANCORA Y: Define o ponto central vertical da linha
	var y_desenho = 1400 + _alt_texto * i
	
	// x1: Canto esquerdo (Centro da tela - metade da largura do texto)
	var x1 = 3200 - _larg_texto / 2
	// y1: Canto superior (Centro do texto - metade da altura do texto)
	var y1 = y_desenho - (_alt_texto / 2) //top left
	
	// x2: Canto direito (Centro da tela + metade da largura do texto)
	var x2 = 3200 + _larg_texto / 2
	// y2: Canto inferior (Centro do texto + metade da altura do texto)
	var y2 = y_desenho + (_alt_texto / 2) //button right
	
	if(point_in_rectangle(_mx, _my, x1, y1, x2, y2))
	{
		esc[i] = lerp(esc[i], 1.3, 0.15)
		if(mouse_check_button_pressed(mb_left)){
			switch menu_inicial[i]
			{
				case menu_inicial[0]: //Jogar
					room_goto(fase1)
					break
				case menu_inicial[1]: //Opções
					show_message("Ainda vou configurar")
					break
				case menu_inicial[2]: //Sair
					game_end()
					break
			}
		}
	}
	else
	{
		esc[i] = lerp(esc[i], 1, 0.15)
	}
	
	draw_text_transformed(3400, 1400 + _alt_texto * i, menu_inicial[i], esc[i], esc[i], 0)
}

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)