var _larg_gui = display_get_gui_width();
var _alt_gui = display_get_gui_height();
var tam_menu = array_length(menu_pause);

if (global.pause) {

    // Coordenadas do mouse (em espaço GUI)
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // Fundo translúcido
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _larg_gui, _alt_gui, false);
    draw_set_alpha(1);
    draw_set_color(c_white);

    // Configurações de fonte e alinhamento
    draw_set_font(fMenu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Posição e espaçamento dos itens
    var espacamento = 60;
    var y_inicio = _alt_gui / 2 - (tam_menu * espacamento) / 2;

	// loop das opções
	for (var i = 0; i < array_length(menu_pause); i++) {
	    var texto   = menu_pause[i];
	    var largura = string_width(texto);
	    var altura  = string_height(texto);
	    var tx      = _mx/2 - largura / 2;
	    var ty      = _my/2 + i * espacamento;

	    // se for o item selecionado, desenha fundo
	    if (i == index) {
	        draw_sprite(spr_menu_bt, -1, _mx/2, ty)
	        draw_set_color(make_color_rgb(63, 62, 58));
		
	    } else draw_set_color(c_white);

	    // desenha texto
	    draw_text(tx, ty, texto);
	}

    // Reset das configurações de desenho
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_color(c_white);
}
