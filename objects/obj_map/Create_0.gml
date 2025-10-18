//geração procedural
tamanho_c   = 128
room_width  = tamanho_c * 40
room_height = room_width div 2
tamanho_w   = room_width div tamanho_c
tamanho_h   = room_height div tamanho_c 

//tamanho da grade
grade       = ds_grid_create(tamanho_w, tamanho_h)
ds_grid_clear(grade, 0)

//direção para gerar as paredes
randomize()
var direcao_c   = irandom(3)
var xx          = tamanho_w div 2
var yy          = tamanho_h div 2
var troca_dir   = 1

//quantidade de inimigos
var inimigo_max = 10

//auto tiles
norte = 1
oeste = 2
leste = 4
sul   = 8

var tile_layer = layer_tilemap_get_id("WallTiles")

for(var i = 0; i < 1500; i++){
	if(irandom(troca_dir) == troca_dir)
		direcao_c = irandom(3)
	
	xx += lengthdir_x(1, direcao_c * 90)
	yy += lengthdir_y(1, direcao_c * 90)
	
	xx  = clamp(xx, 2, tamanho_w - 2)
	yy  = clamp(yy, 2, tamanho_h - 2)
	
	grade[# xx,yy] = 1
}

//tiles
for(var x1 = 0; x1 < tamanho_w; x1++){
	for(var y1 = 0; y1 < tamanho_h; y1++){
		
		if(grade[# x1,y1] == 0){
			
			var nt = grade[# x1,y1 - 1] == 0
			var ot = grade[# x1 - 1,y1] == 0
			var lt = grade[# x1 + 1,y1] == 0
			var st = grade[# x1,y1 + 1] == 0
			
			var indice_tile = norte * nt + oeste * ot + leste * lt + sul * st + 1
			
			tilemap_set(tile_layer, indice_tile, x1, y1);
			
		}
		
		if(grade[# x1,y1] == 1) tilemap_set(tile_layer, 17, x1, y1);
		
	}
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
				
			if(inimigo_max > 0){
				troca_dir = 25
				
				//deixa o spawn dos inimigos aleatorios e verifica se a distancia entre eles é superior a 1000
				if(irandom(troca_dir) == troca_dir and point_distance(x1, y1, obj_player.x, obj_player.y) > 1000){
					instance_create_layer(x1, y1, "instances", obj_inimigo1)
					inimigo_max--
				}
			}
		}
	}
}