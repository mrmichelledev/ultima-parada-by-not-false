get_aggro();

get_state();

if(curr_state == REPOSITION){
	sprite_index = spr_inimigo1_andando
	reposition();
}

if(curr_state == ATTACK){
	sprite_index = spr_inimigo1_atirando
	attack();
}

if(curr_state == IDLE){
	sprite_index = spr_inimigo1_parado
	return_to_origin();
}

if(curr_state == CHASING){
	sprite_index = spr_inimigo1_andando
	chase_player();
}

time_passed++;
atk_timer--;


if(vida_atual == 0) instance_destroy()