//herdando funcoes do pai (depth)
event_inherited();

draw_self();

//Todos estes foram feitos para teste

//Desenha o caminho para o player, não é útil para o inimigo 1, já que sua
//prioridade não é se aproximar, mas manter uma distância ótima
//mas para inimigos posteriores que ataquem a curta distância, será útil
if(keyboard_check(ord("P"))){
	if(aggro) draw_path(path_to_player, x, y, 0);
	else draw_path(path_to_origin, x, y, 0);
}




var _atk_type = false;
var _dis_ao_player = point_distance(x, y, obj_player.x, obj_player.y);

if(!collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true) && 
			_dis_ao_player <= optimal_dis + 10 && _dis_ao_player > atk_range + 10){
				_atk_type = true;
			}



gerenciador_vida.desenha_barraV(x - 15, y - 60, 30, 5, c_red, c_green, c_white, false)

//efeito flash (feedback dano)
if(alfa != 0){
	gpu_set_fog(true, cor, 0, 0)

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, alfa)

	gpu_set_fog(false, cor, 0, 0)
}

