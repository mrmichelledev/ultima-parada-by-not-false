instance_create_layer(x, y, "Projeteis", obj_bullet_explode)
if(obj_armas.arma_atual == 4) instance_create_layer(x, y, "Projeteis", obj_explosao)
audio_play_sound(sn_dano, 3, false)