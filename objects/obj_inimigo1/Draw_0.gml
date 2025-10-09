draw_self();

//Todos estes foram feitos para teste

//Desenha o caminho para o player, não é útil para o inimigo 1, já que sua
//prioridade não é se aproximar, mas manter uma distância ótima
//mas para inimigos posteriores que ataquem a curta distância, será útil
if(keyboard_check(ord("P"))){
	if(aggro) draw_path(path_to_player, x, y, 0);
	else draw_path(path_to_origin, x, y, 0);
}

if(curr_state == IDLE){
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

//draw_text_transformed(x, y+10, check_dir_timer, 0.5, 0.5, image_angle);

//draw_line_width(x, y, obj_player.x, obj_player.y, 0.5);


//draw_text_transformed(x, y-30, 1/abs(distance_to_object(obj_player) - optimal_dis + 1), 0.5, 0.5, image_angle);

draw_text_transformed(x, y-30, sign(speed), 0.5, 0.5, image_angle);

draw_text_transformed(x, y+10, distance_to_object(obj_player), 0.5, 0.5, image_angle);

//draw_text_transformed(x, y-40, floor(99*(distance_to_object(obj_player)/atk_range)), 0.5, 0.5, image_angle);

//draw_text_transformed(x, y+10, aggro, 0.5, 0.5, image_angle);

//var i = 7;

//var x1 = x + dir_collision[i][0];
//var y1 = y + dir_collision[i][1];
//var x2 = x + dir_collision[i][2];
//var y2 = y + dir_collision[i][3];

//var x1_to = x1 + lengthdir_x(20, directions[i][0]);
//var y1_to = y1 + lengthdir_y(20, directions[i][0]);

//var x2_to = x2 + lengthdir_x(20, directions[i][0]);
//var y2_to = y2 + lengthdir_y(20, directions[i][0]);

//draw_line_width(x1, y1, x1_to, y1_to, 0.5);
//draw_line_width(x2, y2, x2_to, y2_to, 0.5);
	
