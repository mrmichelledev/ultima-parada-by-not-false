get_aggro();

get_state();

if(curr_state == REPOSITION){
	reposition();
}

if(curr_state == ATTACK){
	attack();
}

if(curr_state == IDLE){
	return_to_origin();
}

if(curr_state == CHASING){
	chase_player();
}

time_passed++;
atk_timer--;
