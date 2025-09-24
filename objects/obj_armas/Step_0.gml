//se a arma existe
if(instance_exists(arma_id)){
	
	x = arma_id.x
	y = arma_id.y + 3

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
	
	if(keyboard_check_pressed(vk_up)){
		for(var i = i_armas; i <= max_armas; i++){
			var indice = i + 1
			
			if(indice == max_armas + 1) indice = 1
			
					
			if(desbloqueada == true && indice != arma_atual){
				sTroca_Arma(self, indice)
				municao_atual = municao
				i_armas = indice 
				
				exit
			}
		}
	}
	
	if(keyboard_check_pressed(vk_down)){
		for(var i = i_armas; i >= 1; i--){
			var indice = i - 1
			
			if(indice == 0) indice = max_armas
			
			i_armas = indice
			
			if(desbloqueada == true && indice != arma_atual){
				sTroca_Arma(self, indice)
				i_armas = indice 
				
				exit
			}
		}
	}
	
	function atirar(){
		var projetil_inst = instance_create_layer(arma_x, arma_y, "Projeteis", obj_projetil)
		
		if(!arma_atual > 0) return false
		if(!atirarOn) return false
		if(!municao_atual > 0) return false
		
		projetil_inst.sprite_index = projetil
		projetil_inst.image_angle  = arma_direcao
		projetil_inst.direction    = arma_direcao
		projetil_inst.speed        = velocidade
		projetil_inst.dano         = dano
		atirarOn                   = false
		alarm[0]                   = delay
		recuo                      = 8
		municao_atual--
		
	}
	
	
		
	function dropArma(){
		if(!arma_atual > 0) return false
		
		var inst = instance_create_layer(arma_x, arma_y, layer, drop)
		
		inst.image_angle = arma_direcao
		inst.direction   = arma_direcao
		inst.speed       = 2
		inst.municao     = municao_atual
		
		sTroca_Arma(self, 0)
	}
	
	
	function pegaArma(){
		//para pegar a arma mais proxima
		var inst = instance_nearest(x, y, obj_dop_armas)
		
		if(instance_exists(inst)){
			sTroca_Arma(self, inst.arma_index)
			municao_atual = inst.municao
			instance_destroy(inst)
		}
	}
	
	recuo = lerp(recuo, 0, .1)
	
} else instance_destroy()
