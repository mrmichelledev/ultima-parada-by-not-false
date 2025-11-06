// mover seleção
if (keyboard_check_pressed(vk_up) or mouse_wheel_up()) {index--; audio_play_sound(sn_op, 1, false);}
if (keyboard_check_pressed(vk_down) or mouse_wheel_down()) {index++; audio_play_sound(sn_op, 1, false);}

if (index < 0) index = array_length(menu_pause) - 1;
if (index >= array_length(menu_pause)) index = 0;

// confirmar seleção
if (keyboard_check_pressed(vk_escape)) {
	//Pausar o jogo
	global.pause = !global.pause
	
	audio_play_sound(sn_select, 1, false)
	
	switch (index) {
       case menu_pause[0]: global.pause = false; break;
       case menu_pause[1]: show_message("Ainda vou configurar"); break;
	   case menu_pause[2]: room_goto(menu); break;
    }
}