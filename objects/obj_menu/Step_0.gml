// mover seleção
if (keyboard_check_pressed(vk_up) or mouse_wheel_up()) {index--; audio_play_sound(sn_op, 1, false);}
if (keyboard_check_pressed(vk_down) or mouse_wheel_down()) {index++; audio_play_sound(sn_op, 1, false);}

if (index < 0) index = array_length(menu_inicial) - 1;
if (index >= array_length(menu_inicial)) index = 0;

// confirmar seleção
if (keyboard_check_pressed(vk_enter)) {
	audio_play_sound(sn_select, 1, false)
    switch (index) {
        case 0: room_goto(fase1_1); break;
        case 1: 
		// --- CÓDIGO A SER INSERIDO AQUI ---
			var _volume_menu = instance_create_layer(0, 0, "Instances", obj_menu_volume);

		// Passa a referência do menu principal (o objeto atual)
			_volume_menu.parent_menu_object = object_index; 

		// Fecha o menu principal
			instance_destroy(); break;
        case 2: game_end(); break;
    }
}

