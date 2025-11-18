audio_set_master_gain(0, global.volume_master);

array_depth = []

with(obj_depth)
	array_push(other.array_depth, [id, y])


array_sort(array_depth, function(_a, _b){
	return _a[1] - _b[1]
})


if(!instance_exists(obj_inimigo1) and !instance_exists(obj_caixa)){
	instance_create_layer(obj_player.x + 100, obj_player.y, "Instances", obj_caixa)
	
}
