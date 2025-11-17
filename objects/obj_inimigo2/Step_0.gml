get_aggro();

get_state_3();

if(curr_state == REPOSITION){
	sprite_index = spr_inimigo2
	reposition();
}

if(curr_state == ATTACK){
	sprite_index = spr_inimigo2
	attack_3();
}

if(curr_state == IDLE){
	sprite_index = spr_inimigo2_1
	return_to_origin();
}
if(curr_state == CHASING){
	sprite_index = spr_inimigo2
	chase_player();
}

time_passed++;
atk_timer--;


//efeito flash (feedback de dano)
alfa = lerp(alfa, 0, 0.1)


if(vida_atual == 0) instance_destroy()