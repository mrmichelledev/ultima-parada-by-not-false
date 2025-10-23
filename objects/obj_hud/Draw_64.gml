var cor1 = make_color_rgb(30, 55, 29)
var cor2 = make_color_rgb(127, 27, 14)
var teste = make_color_rgb(229, 159, 25)
var cor_dourada = make_color_rgb(212, 178, 78)
var cor_claro = make_color_rgb(233, 217, 140)

gerenciador_vida.desenha_barraV(200, 100, 850, 30, cor2, cor1, c_black)
draw_sprite(spr_barra_vida, 0, 200, 100)

var texto = string(obj_armas.municao_atual)

draw_set_font(fHud)
draw_set_color(cor_claro)
draw_text(200, 200, texto)

//sombra
draw_set_color(cor_dourada)
draw_text(200, 204, texto)



