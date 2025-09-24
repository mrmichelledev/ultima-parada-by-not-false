if(sprite != -1){
	var recuo_x = lengthdir_x(recuo, arma_direcao)
	var recuo_y = lengthdir_y(recuo, arma_direcao)
	
	draw_sprite_ext(sprite, image_index, arma_x - recuo_x, arma_y - recuo_y, image_xscale, image_yscale, arma_direcao, c_white, 1)
}