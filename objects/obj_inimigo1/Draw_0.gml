draw_self();


gerenciador_vida.desenha_barraV(x - 15, y - 60, 30, 5, c_red, c_green, c_white, false)

//efeito flash (feedback dano)
if(alfa != 0){
	gpu_set_fog(true, cor, 0, 0)

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, alfa)

	gpu_set_fog(false, cor, 0, 0)
}

