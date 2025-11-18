// --- Configurações de Posição ---
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();


		// --- Efeito Overlay (Fundo Escurecido) ---
draw_set_color(c_black);
draw_set_alpha(0.7); // 70% de opacidade (ajuste de 0 a 1)
// Desenha um retângulo preto preenchendo toda a área da GUI
draw_rectangle(0, 0, gui_w, gui_h, false);
// Reseta a opacidade e a cor antes de desenhar os elementos do menu
draw_set_alpha(1); 
draw_set_color(c_white);

var scale = 3;

// Centro da tela onde o slider será desenhado
var slider_center_x = gui_w / 2;
var slider_center_y = gui_h / 2; 

// Posições X de Início e Fim do Movimento do Cabo (baseado na largura do sprite)
// Isso garante que o cabo só ande dentro dos limites da barra.
var slider_width = sprite_get_width(spr_slider) * scale;

// O slider (barra) está centralizado, então o início é o centro menos metade da largura.
var slider_x_start = slider_center_x - (slider_width / 2);
var slider_x_end = slider_center_x + (slider_width / 2);

// --- Desenhar a Barra (Trilha do Slider) ---
// Desenha o spr_slider centralizado na tela
draw_sprite_ext(spr_slider, 0, slider_center_x, slider_center_y, scale, scale, 0, c_white, 1);

// ---  Calcular a Posição do Cabo (Handle) ---
// Mapeia o valor de global.volume_master (0 a 1) para o range de X_start a X_end
var handle_x = slider_x_start + (global.volume_master * (slider_x_end - slider_x_start));

// --- 4. Desenhar o Cabo do Slider ---
// Desenha o spr_bolinha_slider na posição calculada (handle_x)
draw_sprite_ext(spr_bolinha_slider, 0, handle_x, slider_center_y, scale, scale, 0, c_white, 1);

// --- 5. Desenhar o Texto ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fMenu)
draw_text(slider_center_x, slider_center_y - 50, "Volume Master");

var volume_percent = string(round(global.volume_master * 100)) + "%";
draw_text(handle_x, slider_center_y + 40, volume_percent);

// --- Desenhando o Botão Salvar ---
var button_x = gui_w / 2;
var button_y = gui_h / 2 + 150; // Abaixo do slider

// Se a opção Salvar estiver selecionada (selected_option == 1), usa c_yellow para destaque
if (selected_option == 1)
{
    draw_set_color(c_yellow);
}
else
{
    draw_set_color(c_white);
}

draw_set_halign(fa_center);
draw_text(button_x, button_y, "SALVAR E VOLTAR");

// Resetar a cor para o próximo desenho
draw_set_color(c_white);