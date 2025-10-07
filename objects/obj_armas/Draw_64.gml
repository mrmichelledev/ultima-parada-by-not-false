if(mouse_wheel_up() or mouse_wheel_down() or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)){
	mostrar_menu = true
	alarm[0] = 30
}


if (mostrar_menu == true){
	var xxx = 700
	var yyy = 500

	draw_sprite(parte1, 0, xxx, yyy)
	draw_sprite(parte2, 0, xxx, yyy)
	draw_sprite(parte3, 0, xxx, yyy)
	draw_sprite(parte4, 0, xxx, yyy)
}