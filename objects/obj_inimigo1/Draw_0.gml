draw_self();

//Todos estes foram feitos para teste

//Desenha o caminho para o player, não é útil para o inimigo 1, já que sua
//prioridade não é se aproximar, mas manter uma distância ótima
//mas para inimigos posteriores que ataquem a curta distância, será útil
if(keyboard_check(ord("P"))){
	if(aggro) draw_path(path_to_player, x, y, 0);
	else draw_path(path_to_origin, x, y, 0);
}

/*if(curr_state == IDLE){
	draw_text_transformed(x, y-20, "idle", 0.5, 0.5, image_angle);
}
if(curr_state == REPOSITION){
	draw_text_transformed(x, y-20, "reposition", 0.5, 0.5, image_angle);
}

if(curr_state == ATTACK){
	draw_text_transformed(x, y-20, "attack", 0.5, 0.5, image_angle);
}

if(curr_state == CHASING){
	draw_text_transformed(x, y-20, "chasing", 0.5, 0.5, image_angle);
}

draw_text_transformed(x, y-30, sign(speed), 0.5, 0.5, image_angle);

draw_text_transformed(x, y+10, point_distance(x, y, obj_player.x, obj_player.y), 0.5, 0.5, image_angle);*/

draw_self();

var x1, y1;
if(image_xscale == -1) x1 = 45
else x1 = -75

gerenciador_vida.desenha_barraV(x + x1, y - 60, 30, 5, c_red, c_green, c_white)