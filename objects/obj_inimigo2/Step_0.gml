//herdando funcoes do pai (depth)
event_inherited();

get_aggro();

get_state_3();

if(curr_state == REPOSITION){
	sprite_index = spr_inimigo2_correndo
	reposition();
}

if(curr_state == ATTACK){
	sprite_index = spr_inimigo2_ataque
	attack_3();
}

if(curr_state == IDLE){
	sprite_index = spr_inimigo2_parado
	return_to_origin();
}
if(curr_state == CHASING){
	sprite_index = spr_inimigo2_correndo
	chase_player();
}

time_passed++;
atk_timer--;


//efeito flash (feedback de dano)
alfa = lerp(alfa, 0, 0.1)


if(vida_atual == 0) instance_destroy()