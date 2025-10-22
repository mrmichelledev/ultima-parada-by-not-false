draw_self();

if(sprite != -1){
	var recuo_x = lengthdir_x(recuo_atual, arma_direcao)
	var recuo_y = lengthdir_y(recuo_atual, arma_direcao)
	
	draw_sprite_ext(sprite, image_index, arma_x - recuo_x, arma_y - recuo_y, image_xscale, image_yscale, arma_direcao, c_white, 1)
}

if (mostrar_menu == true){
	var xxx, yyy = arma_y + 60
	
	if(arma_direcao < 90 || arma_direcao > 270){
		xxx = arma_x + 50
		
	} else {
		xxx = arma_x - 50
	}	
	

	draw_sprite(parte1, 0, xxx, yyy)
	draw_sprite(parte2, 0, xxx, yyy)
	draw_sprite(parte3, 0, xxx, yyy)
	draw_sprite(parte4, 0, xxx, yyy)
}