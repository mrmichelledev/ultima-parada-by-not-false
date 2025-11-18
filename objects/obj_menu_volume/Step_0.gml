// Evento Step do obj_menu_volume

// --- Definições de Posição ---
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var slider_center_x = gui_w / 2;
var slider_center_y = gui_h / 2;

var slider_width = sprite_get_width(spr_slider);

var handle_size = sprite_get_height(spr_bolinha_slider) / 2; 

var slider_x_start = slider_center_x - (slider_width / 2);
var slider_x_end = slider_center_x + (slider_width / 2);


// --- 1. Controle do Slider (Foco 0) ---
if (selected_option == 0) 
{
    // Aumentar Volume (Seta Direita)
    if (keyboard_check(vk_right))
    {
        // Garante que o volume fique entre 0 e 1 (clamp)
        global.volume_master = clamp(global.volume_master + volume_step, 0, 1);
    }
    
    // Diminuir Volume (Seta Esquerda)
    if (keyboard_check(vk_left))
    {
        // Garante que o volume fique entre 0 e 1 (clamp)
        global.volume_master = clamp(global.volume_master - volume_step, 0, 1);
    }
}

// --- Navegação de Foco (Seta Cima/Baixo) ---
// Mudar foco para o botão (opção 1)
if (keyboard_check_pressed(vk_down))
{
    selected_option = 1; 
}

// Mudar foco para o slider (opção 0)
if (keyboard_check_pressed(vk_up))
{
    selected_option = 0; 
}

// --- Ação do Botão "Salvar e Voltar" ---
if (selected_option == 1 && keyboard_check_pressed(vk_enter))
{
    if (parent_menu_object != noone)
    {
        instance_create_layer(0, 0, "Instances", parent_menu_object);
    }
    
    instance_destroy();
}