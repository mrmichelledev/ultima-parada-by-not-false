event_inherited()

//movimentação
velocidade            = 5
velocidade_horizontal = 0
velocidade_vertical   = 0 
direcao               = 0
t                     = 0
global.atirou         = true

//arma do personagem
arma_player = instance_create_layer(x, y, "Armas", obj_armas)
arma_player.arma_id = self


cursor_timer = 0


//criando colisao com a parede
instance_create_layer(x, y, "Instances", obj_colisao_dano)
