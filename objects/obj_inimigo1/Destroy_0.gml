if(obj_armas.arma_atual == 4){ sScreen_Shake(20, 50); audio_play_sound(sn_explosao, 1, false)}

partNumber = random_range(5, 15);

repeat(partNumber){
	instance_create_layer(x+random_range(-2, 2), y-8, "instances", obj_particula)
}



