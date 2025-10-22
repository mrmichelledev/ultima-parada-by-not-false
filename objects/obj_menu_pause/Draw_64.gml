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

    // Loop dos itens do menu
    for (var i = 0; i < tam_menu; i++) {

        var _x = _larg_gui / 2;
        var _y = y_inicio + i * espacamento;
        var _larg_texto = string_width(menu_pause[i]);
        var _alt_texto = string_height(menu_pause[i]);

        // Área do botão (para detectar o mouse)
        var margem_x = 40;
        var margem_y = 15;
        var x1 = _x - _larg_texto / 2 - margem_x;
        var y1 = _y - _alt_texto / 2 - margem_y;
        var x2 = _x + _larg_texto / 2 + margem_x;
        var y2 = _y + _alt_texto / 2 + margem_y;

        // Efeito hover e clique
        if (point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
            esc[i] = lerp(esc[i], 1.2, 0.2); // anima o hover

            draw_set_color(c_yellow); // muda a cor do texto ao passar o mouse

            if (mouse_check_button_pressed(mb_left)) {
                // Ação ao clicar
                switch (menu_pause[i]) {
                    case menu_pause[0]:
                        global.pause = false;
                        break;

                    case menu_pause[1]:
                        show_message("Ainda vou configurar");
                        break;

                    case menu_pause[2]:
                        room_goto(menu);
                        break;
                }
            }

        } else {
            esc[i] = lerp(esc[i], 1, 0.2);
            draw_set_color(c_white);
        }

        // Desenha o texto com escala
        draw_text_transformed(_x, _y, menu_pause[i], esc[i], esc[i], 0);
    }

    // Reset das configurações de desenho
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_color(c_white);
}
