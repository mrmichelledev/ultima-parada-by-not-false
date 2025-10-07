function sTroca_Arma(_id, index){
	arma_atual       = index
	var map          = armas[arma_atual]
	
	_id.sprite       = map[? "sprite"]
	_id.projetil     = map[? "projetil"]
	_id.municao      = map[? "municao"]
	_id.velocidade   = map[? "velocidade"]
	_id.recuo        = map[? "recuo"]
	_id.dano         = map[? "dano"]
	_id.delay        = map[? "delay"]
	_id.automatico   = map[? "automatico"]
	_id.drop         = map[? "drop"]
	_id.desbloqueada = map[? "desbloqueada"]
}