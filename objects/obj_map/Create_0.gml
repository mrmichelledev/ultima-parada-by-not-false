//geração procedural
tamanho_c   = 64
room_width  = tamanho_c * 32
room_height = room_width div 2
tamanho_w   = room_width div tamanho_c
tamanho_h   = room_height div tamanho_c

//tamanho da grade
grade       = ds_grid_create(tamanho_w, tamanho_h)
ds_grid_clear(grade, 0)

//direção para gerar as paredes
randomize()
var direcao_c = irandom(3)
var xx        = tamanho_w div 2
var yy        = tamanho_h div 2
var troca_dir = 1

for(var i = 0; i < 400; i++){
	if(irandom(troca_dir) == troca_dir)
		direcao_c = irandom(3)
	
	xx += lengthdir_x(1, direcao_c * 90)
	yy += lengthdir_y(1, direcao_c * 90)
	
	xx  = clamp(xx, 2, tamanho_w - 2)
	yy  = clamp(yy, 2, tamanho_h - 2)
	
	grade[# xx,yy] = 1
}


//verificar se a posição da grade é 0 ou 1,
//se for 0, ele cria uma parede;
for(var i = 0; i < tamanho_w; i++){
	for(var j = 0; j < tamanho_h; j++){
		
		//cria paredes
		if(grade[# i,j] == 0) 
			instance_create_layer(i * tamanho_c, j * tamanho_c, "instances", obj_parede)
		
		//cria objetos
		if(grade[# i,j] == 1){
			
			var x1 = i * tamanho_c + tamanho_c / 2
			var y1 = j * tamanho_c + tamanho_c / 2
				
			if(!instance_exists(obj_player))
				instance_create_layer(x1, y1, "instances", obj_player)
		}
	}
}