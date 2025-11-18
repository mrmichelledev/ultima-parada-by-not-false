//herdando funcoes do pai (depth)
event_inherited();

if(global.pause){image_speed = 0; exit}
else image_speed = 1

//teclas para a movimentação 
var cima     = keyboard_check(ord("W"));
var baixo    = keyboard_check(ord("S"));
var esquerda = keyboard_check(ord("A"));
var direita  = keyboard_check(ord("D"));

//verifica se alguma tecla esta sendo pressionada, para deixar o personagem parado
t = (direita - esquerda) != 0 ||  (baixo - cima) != 0 

direcao = point_direction(0, 0, (direita - esquerda), (baixo - cima))

velocidade_horizontal = lengthdir_x(velocidade * t, direcao)
velocidade_vertical   = lengthdir_y(velocidade * t, direcao)
	
x += velocidade_horizontal
y += velocidade_vertical



//direção da arma
with(arma_player){
	var mb
	var key_drop = keyboard_check_pressed(ord("F"))
	
	if(automatico) mb = mouse_check_button(mb_left)
	else mb = mouse_check_button_pressed(mb_left)
	
	arma_direcao = point_direction(x, y, mouse_x, mouse_y)
	
	if (mb) {
		if(arma_atual == 0 || municao_atual == 0) audio_play_sound(sn_notammo, 2, false)
	    atirar();
	}
	
	if(key_drop && arma_atual > 0) dropArma()
	else if(key_drop && arma_atual == 0) pegaArma()
}



if (mb) {
    cursor_sprite = spr_cursor_atirando;
    cursor_timer = 10;
}

if (cursor_timer > 0) {
    cursor_timer--;
    if (cursor_timer == 0) cursor_sprite = spr_cursor
}

