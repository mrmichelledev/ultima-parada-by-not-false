vida_atual = gerenciador_vida.perde_vida(obj_armas.dano)
if(vida_atual == 0) instance_destroy()
audio_play_sound(sn_dano, 3, false)
sScreen_Shake(5, 5)
