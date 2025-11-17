if(surface_exists(luz)){
	
	surface_set_target(luz)
	
	draw_set_alpha(0.30)
	draw_set_colour(c_black)
	draw_rectangle(0, 0, room_width, room_height, 0)
	
	//resetando
	draw_set_alpha(1)
	draw_set_colour(-1)
	
	gpu_set_blendmode(bm_subtract)
	with(obj_player)
		draw_sprite(spr_luz, 0, self.x + 2, self.y + 30)


	
	//resetando o blend
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	
	//desehando a luz
	draw_surface(luz, 0, 0)
	

} else luz = surface_create(room_width, room_height)