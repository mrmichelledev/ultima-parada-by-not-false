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
}

if (global.pause) {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        
        audio_play_sound(sn_select, 1, false); // Som de confirmação
        
        switch (index) {
            case 0: // "Continuar"
                global.pause = false; break; // DESPAUSA o jogo
            case 1: // "Opcoes"

				var _volume_menu = instance_create_layer(0, 0, "Instances", obj_menu_volume);

			// Passa a referência do menu de pause (o objeto atual)
				_volume_menu.parent_menu_object = object_index; 

			// Fecha o menu de pause
				instance_destroy(); break;
            case 2: // "Sair para o menu"
                room_goto(menu); break;
        }
    }
}