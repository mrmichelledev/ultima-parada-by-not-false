function sVida(_vida_max) constructor{
	
	//variaveis padrão para a vida
	vida_max              = _vida_max
	vida_atual            = vida_max
	barra_delay           = vida_atual
	barra_efeito          = vida_atual
	
	static perde_vida     = function(_dano){
		vida_atual       -= _dano
		vida_atual        = clamp(vida_atual, 0, vida_max)
		
		return vida_atual
	}
	
	static ganha_vida     = function(_recupera){
		vida_atual       += _recupera
		vida_atual        = clamp(vida_atual, 0, vida_max)
		
		return vida_atual
	}
	
	//desenhando a barra de vida
	///@function desenha_barraV(x, y, largura, altura, cor1, cor2, cor3)
	static desenha_barraV = function(_x, _y, _largura, _altura, _cor1, _cor2, _cor3, _background){
		var barra_tam     = (vida_atual / vida_max) * _largura
		var barra_tam_ef  = (barra_efeito / vida_max) * _largura
		var c_            = merge_color(_cor1, _cor2, (vida_atual / vida_max))
		
		barra_delay       = lerp(barra_delay, vida_atual, 0.1)
		barra_efeito      = lerp(barra_efeito, barra_delay, 0.03)
		
		//fundo da barra de vida
		if(_background)
			draw_rectangle_color(_x, _y, _x + _largura, _y + _altura, _cor3, _cor3, _cor3, _cor3, false)
		
		//efeito barra
		draw_rectangle_color(_x, _y, _x +  barra_tam_ef, _y + _altura, _cor1, _cor1, _cor1, _cor1, false)
		
		//cor da barra de vida
		draw_rectangle_color(_x, _y, _x + barra_tam, _y + _altura, c_, c_, c_, c_, false)
	}
}