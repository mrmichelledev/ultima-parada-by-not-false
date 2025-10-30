global.meioTransicao = false
global.roomTar = -1

function sTransicao_sequence(_tipo){
	if(layer_exists("Transicao")) layer_destroy("Transicao")
	
	var _layer = layer_create(-999, "Transicao")
	layer_sequence_create(_layer, 0, 0, _tipo)
}

function sTransicao_inicia(_target, _tipo){
	if(!global.meioTransicao){
		global.roomTar = _target
		global.meioTransicao = true
		sTransicao_sequence(_tipo)
		layer_set_target_room(_target)
		sTransicao_sequence(_tipo)
		layer_reset_target_room()
		return true
	
	} else return false

}

function sTransicao_termina(){
	layer_sequence_destroy(self.elementID)
	global.meioTransicao = false 
}