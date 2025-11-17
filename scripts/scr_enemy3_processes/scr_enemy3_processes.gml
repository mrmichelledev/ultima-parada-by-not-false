function attack_3(){
	dis_ao_player = point_distance(x, y, obj_player.x, obj_player.y);
	
	if(atk_timer <=0){
		if(dis_ao_player <= atk_range){//se o player entrar no range, ataca
		//atacar.
		time_passed += 10
		atk_timer = atk_cd;
		atk_type = false;
		}
		
		else if(!collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true) && 
			dis_ao_player <= optimal_dis + 10 && dis_ao_player > atk_range + 10){
		
			
			dir = point_direction(x, y, obj_player.x, obj_player.y);
			
			x_alvo = x + lengthdir_x(30*mv_spd, dir);
			y_alvo = y + lengthdir_y(30*mv_spd, dir);
			
			motion_time = abs(3*floor(point_distance(x, y, x_alvo, y_alvo)/(3*mv_spd)));
			
			atk_timer = atk_cd;
			atk_type = true;
			wait = 60;
		}
	}
	
	if(atk_type){
		
		
		
		if(wait-- >= 0){
			speed = 0;
			time_passed = 0;
			atk_timer = atk_cd;
		}else{
			var _temp_mv_spd;
			_temp_mv_spd = 3*mv_spd;
		
		
			if(motion_time-- > 0){
				motion_set(dir, _temp_mv_spd);
			}
			else{
				
				speed = 0;
			}
		}
		
	}
		
}
function get_state_3(){
	
	if(aggro){
		if(time_passed >= action_time){
			time_passed = 0;
		
			dis = point_distance(x, y, obj_player.x, obj_player.y);
			action = irandom(99);
			action -= 30*reposition_counter;
			action += 30*atk_counter;
			
			//se estiver fora do range de aggro, se aproximar
			if(dis > aggro_dis){
				curr_state = CHASING;
			}
			else if(dis <= atk_range && curr_state != ATTACK){
				curr_state = ATTACK;
				atk_counter++;
				reposition_counter = 0;
			}
			else
			//se tiver obstáculos entre o player e o inimigo, escolhe se reposicionar (sempre).
			//as chances de reposicionar diminuem quanto mais vezes ele se reposiciona consecutivamente.
			if(action >= 49 or (collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true)) or dis > optimal_dis + 10){
				check_dir_timer = 0;
				reposition_counter++;
				atk_counter = 0;
				curr_state = REPOSITION;	
			}
			else{
				reposition_counter = 0;
				atk_counter++;
				curr_state = ATTACK;
			}
		}
	}
	else{
		curr_state = IDLE;
		reposition_counter = 0;
	}
	
}