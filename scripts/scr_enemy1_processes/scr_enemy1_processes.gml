function get_aggro(){
	//get distance to player
	 dis = point_distance(x, y, obj_player.x, obj_player.y);
	 
	 //se o player está dentro do range de detecção
	if(dis <= aggro_dis){
		
		//se há uma parede entre o player e o inimigo
		if(collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, false)){
			detection_delay = 2*dis;
			detection_timer = detection_delay;
			
		}
		else{
			detection_timer--;
			aggro_timer = aggro_delay;
		}
		if(detection_timer <= 0){
			detection_timer = detection_delay;
			aggro = true;
		}
	}
	else{
		aggro_timer--;
		if(aggro_timer <= 0){
			aggro = false;
			aggro_timer = aggro_delay;
		}
	}
}

function chase_player(){
	
	if(aggro && curr_state == CHASING){
		//should we calc our path
		if(calc_path_timer-- <= 0 && dis > atk_range && !collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true)){
			//reset timer
			calc_path_timer = calc_path_delay;
		
			//can we make a path to the player?
			var _found_player = mp_grid_path(global.mp_grid, path_to_player, x, y, obj_player.x, obj_player.y, choose(0, 1));
	
			//start path if we can reach the player;
	
			if(_found_player){
				//Deve haver a animação de andar aqui
				image_index = spr_inimigo1_andando
				
				//Se ele estiver se movendo para a direita
				if(direction > -90 and direction <= 90){
					//Olhar para a direita
					image_xscale = 1
				}
				else{
					//Olhar para a esquerca
					image_xscale = -1
				}
				
				path_start(path_to_player, mv_spd, path_action_stop, false);
				
			}
		}
		else{
			if(dis <= atk_range && !(collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true))){
				//Aqui a animação deve terminar
				
				path_end();
			}
		}
	}
}

function return_to_origin(){
		
	//retorna à origem se não está na origem e se não detecta o player
	if((calc_path_timer-- <= 0 or (x != x_origin && y != y_origin)) and !aggro){
		calc_path_timer = calc_path_delay;
		
		var _found_path = mp_grid_path(global.mp_grid, path_to_origin, x, y, x_origin, y_origin, choose(0, 1));
		
		if(_found_path){
			
			//Deve haver a animação de andar aqui
			image_index = spr_inimigo1_andando
			
			//Se ele estiver se movendo para a direita
			if(direction > -90 and direction <= 90){
				//Olhar para a direita
				image_xscale = 1
			}
			else{
				//Olhar para a esquerca
				image_xscale = -1
			}
			
			path_start(path_to_origin, 0.7*mv_spd, path_action_stop, false);
			
		}
	}
	if(aggro){
		
		//Aqui a animação deve terminar
		image_index = spr_inimigo1_parado
		path_end();
	}
	
}

function get_state(){
	
	if(aggro){
		if(time_passed >= action_time){
			time_passed = 0;
		
			dis = point_distance(x, y, obj_player.x, obj_player.y);
			action = irandom(99);
			action -= reposition_counter*20;
			
			//se estiver fora do range de ataque, se aproximar
			if(dis > aggro_dis){
				curr_state = CHASING;
			}
			else
			//quanto mais perto do player, maior a chance de reposicionamento
			//se tiver obstáculos entre o player e o inimigo, escolhe se reposicionar (sempre).
			//as chances de reposicionar diminuem quanto mais vezes ele se reposiciona consecutivamente.
			if(action >= floor(99*(dis/atk_range)) or (collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, false))){
				check_dir_timer = 0;
				reposition_counter++;
				curr_state = REPOSITION;	
			}
			else if((collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true))){
				check_dir_timer = 0;
				curr_state = REPOSITION;
				reposition_counter++;
			}
			else{
				reposition_counter = 0;
				curr_state = ATTACK;
			}
		}
	}
	else{
		curr_state = IDLE;
		reposition_counter = 0;
	}
	
}

function attack(){
	//Se ele não tiver atacado recentemente
	if(atk_timer <= 0){
		
		//Aqui deve ter a animação de atacar, mirando na direção do player
		// sign(obj_player.x)
		image_index = spr_inimigo1_atirando
		
		speed = 0;
		
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		var x1;
		
		if(image_xscale = -1) x1 = 61
		else x1 = -18
		
		var _bullet = instance_create_layer(x + x1, y, "Projeteis", obj_bullet);
		var _bullet_fire = instance_create_layer(x + x1, y, "Projeteis", obj_fire);

		with(_bullet){
			audio_play_sound(sn_inimigo1, 3, false)
			_bullet_fire.sprite_index = m_14;
			_bullet_fire.direction = _dir;
			_bullet_fire.image_angle =_dir;
			_bullet_fire.image_blend = c_white;
			speed = other.bullet_speed;
			direction = _dir;
			image_angle = _dir;
			owner_id = other;
		}
		atk_timer = atk_cd;
	}
	
	
	
	
}

function reposition(){
	
		if(check_dir_timer-- <= 0){		
			
			check_dir_timer = check_dir_delay;
			move_dir = get_dir();
			
		}
		
		var _xmove = lengthdir_x(mv_spd, move_dir);
		var _ymove = lengthdir_y(mv_spd, move_dir);
		
		//Se o movimento horizontal for para a direita
		if(_xmove > 0){
			//Olhar para a direita
			image_xscale = 1
		}
		//Se for para a esquerda
		else if(_xmove < 0){
			//Olhar para a esquerda
			image_xscale = -1
		}
		//Se o movimento for puramente vertical
		else{
			//Olhar para a direção (direita ou esquerda) do player
			//Fazer isso usando sign(obj_player.x)
		}
		
		x += _xmove;
		y += _ymove;
		
}

function get_dir(){
	
	var i = 0;
	//zera os pesos
	for(i = 0; i<8; i++){
		directions[i][1] = 0;
	}
	
	//coordenadas do ponto alvo: o ponto para qual ele se moveria na direção escolhida
	var _target_x;
	var _target_y;
	
	//distância do ponto alvo ao player
	var _target_dis_to_player;
	var _curr_dis_to_player;
	var _best_index = 0;
	var _best_weight = 0;
	
	var _step_dis = mv_spd*check_dir_delay;

	i = 0;
	
	//Se há obstáculos entre o player e o inimigo
	if(collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true)){
		
		//Boolean que diz achou uma direção válida
		found_dir = false;
		
		//O quanto o inimigo vai olhar à frente para tentar determinar uma direção válida
		var _visao = point_distance(x, y, obj_player.x, obj_player.y);
		if(_visao > atk_range){
			_visao = atk_range;
		}
		
		//Coordenadas do ponto a ser avaliado
		var _lookup_x;
		var _lookup_y;
		var j = _step_dis;
			
			while(!found_dir and j <= atk_range){
				for(i=0; i<8; i++){
					var _curr_dir = directions[i][0];
					
					_lookup_x = x + lengthdir_x(_visao, _curr_dir);
					_lookup_y = y + lengthdir_y(_visao, _curr_dir);
				
					_target_x = x + lengthdir_x(_step_dis, _curr_dir);
					_target_y = y + lengthdir_y(_step_dis, _curr_dir);
				
					_target_dis_to_player = point_distance(_target_x, _target_y, obj_player.x, obj_player.y);
				
					//Distância até o local desejado (é desnecessário, só percebi agora)
					var _distance_to_go = point_distance(x, y, _target_x, _target_y);
					
					//Se não houver obstáculos na direção avaliada e se o próximo passo nessa direção não vai colidir
					if(!collision_line(_lookup_x, _lookup_y, obj_player.x, obj_player.y, obj_parede, false, true) and
						!place_meeting(_target_x, _target_y, obj_parede))
					{
						
						//Atribui um peso baseado no quão boa a próxima posição vai ser após o próximo passo
						directions[i][1] = 100/(_distance_to_go + abs(_target_dis_to_player - optimal_dis));
						found_dir = true;
						
						//Tende a se manter em uma só direção para evitar ficar se mexendo de um lado para
						//o outro sem sair do lugar
						if(dir_index == i){
							directions[i][1] += 5;
						}
					}
					if(directions[i][1] > _best_weight){
						_best_index = i;
						_best_weight = directions[i][1];
						dir_index = _best_index;
					}
				
				}
			j+= 10;	
				
			}
		
		//Se não conseguir achar uma direção passa para o estado de correr atrás do player
		//Ainda não é a solução final, só não consegui implementar o que tenho em mente ainda
		if(found_dir == false){
			curr_state = CHASING;
		}
		
		return directions[_best_index][0];
	}
	
		//Se não houver obstáculo entre o player e o inimigo roda o algoritmo padrão
		//que é basicamente o mesmo que o dentro do if, porém sem a necessidade das coordenadas "lookup"
		for(i=0; i<8; i++){
		
		_target_x = x + lengthdir_x(check_dir_delay*mv_spd, directions[i][0]);
		_target_y = y + lengthdir_y(check_dir_delay*mv_spd, directions[i][0]);
		
		_target_dis_to_player = point_distance(_target_x, _target_y, obj_player.x, obj_player.y);
		_curr_dis_to_player = point_distance(x, y, obj_player.x, obj_player.y);
			
		
		directions[i][1] = 1/abs(_target_dis_to_player - optimal_dis);
		
		if(dir_index == i){
			directions[i][1] += 5;
		}
	
	
		if(collision_line(_target_x, _target_y, obj_player.x, obj_player.y, obj_parede, false, true)){
			directions[i][1] = directions[i][1]/2;
			
		}
		
		if(place_meeting(_target_x, _target_y, obj_parede)){
			directions[i][1] = -1;
		}
		
		if(directions[i][1] > _best_weight){
			_best_index = i;
			_best_weight = directions[i][1];
			dir_index = _best_index;
		}
		
		
	}
	
	
	return directions[_best_index][0];
	
}