var cor1        = make_color_rgb(127, 50, 73)
var cor2        = make_color_rgb(127, 27, 14)
var teste       = make_color_rgb(229, 159, 25)
var cor_dourada = make_color_rgb(212, 178, 78)
var cor_azul    = make_color_rgb(56, 80, 91)
var cor_claro   =c_black

var lar         =  display_get_width() - 500

gerenciador_vida.desenha_barraV(lar, 100, 860, 30, cor2, cor1, c_black, true)
draw_sprite(spr_barra_vida, 0, lar, 100)

if(obj_armas.arma_atual > 0){
	var barra_tam   = 860 * (obj_armas.municao_atual / obj_armas.municaoMax)
	var barra_tFix  = 860

	//cor da barra background
	//draw_rectangle_color(lar - 5, 155, lar + barra_tFix + 5, 180,  cor_claro, cor_claro, cor_claro, cor_claro, false)
	
	//cor da barra de municao
	draw_rectangle_color(lar, 160, lar + barra_tam, 175,  cor_dourada, cor_dourada, cor_dourada, cor_dourada, false)
}




