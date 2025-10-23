//se a arma existe
if(instance_exists(arma_id)){
	
	//sprite player
	if(obj_player.t != 0 and arma_atual == 0) obj_player.sprite_index = spr_player_andando
	else if(obj_player.t == 0 and arma_atual == 0)  obj_player.sprite_index = spr_player_parado
	else if(obj_player.t != 0 and arma_atual != 0) obj_player.sprite_index  = spr_player_andando_sem_braco_1
	else obj_player.sprite_index = spr_player_parado_sem_braco_1
	
	x = arma_id.x
	y = arma_id.y
	
	image_speed = 0.1166
	
	if(arma_direcao < 90 || arma_direcao > 270){
		image_yscale = 1
		arma_id.image_xscale = 1
		
	} else {
		image_yscale = -1
		arma_id.image_xscale = -1
		
	}	
	
	arma_x = x + lengthdir_x(15, arma_direcao)
	arma_y = y + lengthdir_y(15, arma_direcao)
	
	image_angle = arma_direcao
	
	if(mouse_wheel_up() || keyboard_check_pressed(vk_up)){
		audio_play_sound(sn_equipe, 3, false)
	    mostrar_menu = true;
	    alarm[0] = 30;

	    var start = i_armas; // posição atual do cursor
	    var passos = 0;
	    var encontrou = false;

	    // procura a próxima arma desbloqueada (sentido horário) com wrap, no máximo max_armas tentativas
	    while(passos < max_armas){
	        passos += 1;
	        var indice = start + passos;
			
	        if(indice > max_armas) indice -= max_armas;

	        // testar corretamente o campo "desbloqueada" na ds_map
	        if(armas[indice][? "desbloqueada"] && indice != arma_atual){
	            sTroca_Arma(self, indice);
				
	            // atualiza munição a partir do mapa (segurança caso sTroca_Arma não atribua)
	            if(ds_exists(armas[indice], ds_type_map)) municao_atual = armas[indice][? "municao"];
	            
	            i_armas = indice;
	            encontrou = true;
	            break;
	        }
	    }

	}

	if(mouse_wheel_down() || keyboard_check_pressed(vk_down)){
		audio_play_sound(sn_equipe, 3, false)
	    mostrar_menu = true;
	    alarm[0] = 30;

	    var start = i_armas;
	    var passos = 0;
	    var encontrou = false;

	    // procura a próxima arma desbloqueada (sentido anti-horário) com wrap
	    while(passos < max_armas){
	        passos += 1;
	        var indice = start - passos;
	        if(indice < 1) indice += max_armas;

	        if(armas[indice][? "desbloqueada"] && indice != arma_atual){
	            sTroca_Arma(self, indice);
				
	            if(ds_exists(armas[indice], ds_type_map)) municao_atual = armas[indice][? "municao"];
	          
			    i_armas = indice;
	            encontrou = true;
	            break;
	        }
	    }
	}

	
	function atirar(){
		var an, am
		if (arma_direcao < 90 || arma_direcao > 270)an = -90
		else an = 90
		
		// calcula posição de spawn rotacionando o offset (ox, oy) pela arma_direcao
	    var spawn_x = arma_id.x + lengthdir_x(xProjetil, arma_direcao) + lengthdir_x(yProjetil, arma_direcao + 90);
	    var spawn_y = arma_id.y + lengthdir_y(xProjetil, arma_direcao) + lengthdir_y(yProjetil, arma_direcao + an);
		
		var projetil_inst = instance_create_layer(spawn_x, spawn_y, "Projeteis", obj_projetil)
		var muzzle_fire   = instance_create_layer(spawn_x, spawn_y, "Projeteis", obj_fire)
		
		if(!arma_atual > 0) return false
		if(!atirarOn) return false
		if(!municao_atual > 0) return false
		
		
		projetil_inst.sprite_index = projetil
		projetil_inst.image_angle  = arma_direcao
		projetil_inst.direction    = arma_direcao
		projetil_inst.speed        = velocidade
		projetil_inst.dano         = dano
		muzzle_fire.sprite_index   = muzzle
		muzzle_fire.image_angle    = arma_direcao
		muzzle_fire.direction      = arma_direcao
		recuo_atual                = recuo
		atirarOn                   = false
		alarm[0]                   = delay
		municao_atual--
		audio_play_sound(som, 2, false)
		
	}
	
	
		
	function dropArma(){
		if(!arma_atual > 0) return false
		
		var inst = instance_create_layer(arma_x, arma_y, layer, drop)
		
		inst.image_angle  = arma_direcao
		inst.direction    = arma_direcao
		inst.speed        = 2
		inst.municao      = municao_atual
		ds_map_replace(armas[arma_atual], "desbloqueada", false)
		sTroca_Arma(self, 0)
	}
	
	
	function pegaArma(){
		//para pegar a arma mais proxima
		var inst = instance_nearest(x, y, obj_dop_armas)
		
		
		if(instance_exists(inst) and point_distance(inst.x, inst.y, obj_player.x, obj_player.y) < 50){
			sTroca_Arma(self, inst.arma_index)
			municao_atual = inst.municao
			instance_destroy(inst)
			ds_map_replace(armas[arma_atual], "desbloqueada", true)
			instance_destroy(obj_f)
		}
		
	}
	
	recuo_atual = lerp(recuo_atual, 0, .1)
	
} else instance_destroy()


if(arma_atual == 1){
	parte1 = spr_wheel_se2
	if(armas[1][? "desbloqueada"]) parte2 = spr_wheel_un1 else parte2 = spr_wheel_unk1
	if(armas[2][? "desbloqueada"]) parte3 = spr_wheel_un3 else parte3 = spr_wheel_unk3
	if(armas[3][? "desbloqueada"]) parte4 = spr_wheel_un4 else parte4 = spr_wheel_unk4
}

if(arma_atual == 2){
	
	parte1 = spr_wheel_un2
	if(armas[1][? "desbloqueada"]) parte2 = spr_wheel_se1 else parte2 = spr_wheel_unk1
	if(armas[2][? "desbloqueada"]) parte3 = spr_wheel_un3 else parte3 = spr_wheel_unk3
	if(armas[3][? "desbloqueada"]) parte4 = spr_wheel_un4 else parte4 = spr_wheel_unk4
}

if(arma_atual == 3){
	
	parte1 = spr_wheel_un2
	if(armas[1][? "desbloqueada"]) parte2 = spr_wheel_un1 else parte2 = spr_wheel_unk1
	if(armas[2][? "desbloqueada"]) parte3 = spr_wheel_se3 else parte3 = spr_wheel_unk3
	if(armas[3][? "desbloqueada"]) parte4 = spr_wheel_un4 else parte4 = spr_wheel_unk4
}

if(arma_atual == 4){
	
	parte1 = spr_wheel_un2
	if(armas[1][? "desbloqueada"]) parte2 = spr_wheel_un1 else parte2 = spr_wheel_unk1
	if(armas[2][? "desbloqueada"]) parte3 = spr_wheel_un3 else parte3 = spr_wheel_unk3
	if(armas[3][? "desbloqueada"]) parte4 = spr_wheel_se4 else parte4 = spr_wheel_unk4
}