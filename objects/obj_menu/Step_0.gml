// mover seleção
if (keyboard_check_pressed(vk_up) or mouse_wheel_up()) index--;
if (keyboard_check_pressed(vk_down) or mouse_wheel_down()) index++;

if (index < 0) index = array_length(menu_inicial) - 1;
if (index >= array_length(menu_inicial)) index = 0;

// confirmar seleção
if (keyboard_check_pressed(vk_enter)) {
    switch (index) {
        case 0: room_goto(fase1); break;
        case 1: show_message("em processo..."); break;
        case 2: game_end(); break;
    }
}

