//camera
if(instance_exists(alvo)){
	x      = lerp(x, (alvo.x - largura_c / 2), velocidade_c)
	y      = lerp(y, (alvo.y - altura_c / 2), velocidade_c)
	
	x      = clamp(x, 0, room_width - largura_c)
	y      = clamp(y, 0, room_height - altura_c)
	
	if(shake_forca != 0){
		x += random_range(-shake_forca, shake_forca)
		y += random_range(-shake_forca, shake_forca)
	}
	
	camera_set_view_pos(view_camera[0], x, y)
	
} else {
	alvo   = -1;
}