//teclas para a movimentação 
var cima     = keyboard_check(ord("W"));
var baixo    = keyboard_check(ord("S"));
var esquerda = keyboard_check(ord("A"));
var direita  = keyboard_check(ord("D"));

//verifica se alguma tecla esta sendo pressionada, para deixar o personagem parado
var t = (direita - esquerda) != 0 ||  (baixo - cima) != 0 

direcao = point_direction(0, 0, (direita - esquerda), (baixo - cima))

velocidade_horizontal = lengthdir_x(velocidade * t, direcao)
velocidade_vertical   = lengthdir_y(velocidade * t, direcao)

//colisao horizontal
if(place_meeting(x + sign(velocidade_horizontal), y, obj_parede)){
	while(!place_meeting(x + sign(velocidade_horizontal), y, obj_parede)){
		x += sign(velocidade_horizontal)
	}
		
	velocidade_horizontal = 0;
}
	
x += velocidade_horizontal

//colisao vertical
if(place_meeting(x, y + sign(velocidade_vertical), obj_parede)){
	while(!place_meeting(x, y + sign(velocidade_vertical), obj_parede)){
		y += sign(velocidade_vertical)
	}
		
	velocidade_vertical = 0;
}
	
y += velocidade_vertical

//direção da arma
with(arma_player){
	var mb
	var key_drop = keyboard_check_pressed(ord("F"))
	
	if(automatico) mb = mouse_check_button(mb_left)
	else mb = mouse_check_button_pressed(mb_left)
	
	arma_direcao = point_direction(x, y, mouse_x, mouse_y)
	
	if(mb) atirar()
	if(key_drop && arma_atual > 0) dropArma()
	else if(key_drop && arma_atual == 0) pegaArma()
}