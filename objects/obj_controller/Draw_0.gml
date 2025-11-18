for(var i = 0; i < array_length(array_depth); i++){
	var index = array_depth[i]
	var inst = index[0]
	
	with(inst)
		event_perform(ev_draw, 0)
}