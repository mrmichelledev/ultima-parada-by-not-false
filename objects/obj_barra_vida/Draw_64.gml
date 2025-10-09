var quant_barra = (vida / vida_max) * barraW

var x1 = 90
var y1 = 30
var x2 = x1 + quant_barra
var y2 = y1 + barraH


if(vida > 0){
	draw_set_color(colorR)
	draw_rectangle(x1, y1, x2, y2, 0)
}