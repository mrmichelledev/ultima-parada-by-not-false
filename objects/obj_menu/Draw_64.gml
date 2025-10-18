draw_set_font(fMenu)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_white)

var espacamento = 60;
var x_centro    = display_get_width() / 2;
var y_inicio    = display_get_height() / 2 - (array_length(menu_inicial) * espacamento) / 2;

// loop das opções
for (var i = 0; i < array_length(menu_inicial); i++) {
    var texto   = menu_inicial[i];
    var largura = string_width(texto);
    var altura  = string_height(texto);
    var tx      = 3100 - largura / 2;
    var ty      = 1400 + i * espacamento;

    // se for o item selecionado, desenha fundo
    if (i == index) {
        draw_sprite(spr_menu_bt, -1, 3120, ty)
        draw_set_color(make_color_rgb(63, 62, 58));
		
    } else draw_set_color(c_white);

    // desenha texto
    draw_text(tx, ty, texto);
}

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)

