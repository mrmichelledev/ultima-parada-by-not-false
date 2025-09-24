//sem armas
armas[0] = ds_map_create()
ds_map_add(armas[0], "sprite", -1)
ds_map_add(armas[0], "projetil", -1)
ds_map_add(armas[0], "municao", 0)
ds_map_add(armas[0], "velocidade", 0)
ds_map_add(armas[0], "dano", 0)
ds_map_add(armas[0], "delay", 0)
ds_map_add(armas[0], "automatico", false)
ds_map_add(armas[0], "drop", -1)
ds_map_add(armas[0], "desbloqueada", true)

//pistola
armas[1] = ds_map_create()
ds_map_add(armas[1], "sprite", spr_pistola)
ds_map_add(armas[1], "projetil", pro)
ds_map_add(armas[1], "municao", 10)
ds_map_add(armas[1], "velocidade", 10)
ds_map_add(armas[1], "dano", 10)
ds_map_add(armas[1], "delay", 20)
ds_map_add(armas[1], "automatico", false)
ds_map_add(armas[1], "drop", obj_pistola)
ds_map_add(armas[1], "desbloqueada", true)

//escopeta
armas[2] = ds_map_create()
ds_map_add(armas[2], "sprite", spr_escopeta)
ds_map_add(armas[2], "projetil", pro)
ds_map_add(armas[2], "municao", 6)
ds_map_add(armas[2], "velocidade", 8)
ds_map_add(armas[2], "dano", 20)
ds_map_add(armas[2], "delay", 40)
ds_map_add(armas[2], "automatico", false)
ds_map_add(armas[2], "drop", obj_escopeta)
ds_map_add(armas[2], "desbloqueada", true)

//metralhadora
armas[3] = ds_map_create()
ds_map_add(armas[3], "sprite", spr_metralhadora)
ds_map_add(armas[3], "projetil", pro)
ds_map_add(armas[3], "municao", 30)
ds_map_add(armas[3], "velocidade", 12)
ds_map_add(armas[3], "dano", 5)
ds_map_add(armas[3], "delay", 5)
ds_map_add(armas[3], "automatico", true)
ds_map_add(armas[3], "drop", obj_metralhadora)
ds_map_add(armas[3], "desbloqueada", true)

//bazuka
armas[4] = ds_map_create()
ds_map_add(armas[4], "sprite", spr_bazuka)
ds_map_add(armas[4], "projetil", pro)
ds_map_add(armas[4], "municao", 3)
ds_map_add(armas[4], "velocidade", 6)
ds_map_add(armas[4], "dano", 50)
ds_map_add(armas[4], "delay", 90)
ds_map_add(armas[4], "automatico", false)
ds_map_add(armas[4], "drop", obj_bazuka)
ds_map_add(armas[4], "desbloqueada", true)

//padrão das armas
arma_id      = -1
escala       = -1
arma_direcao = -1
arma_x       = 0
arma_y       = 0
recuo        = 0
atirarOn     = true

sTroca_Arma(self, 3)

municao_atual = municao

//scrollar as armas
max_armas = 4
i_armas = arma_atual

//menu circular
mostrar_menu = false
parte1 = spr_wheel_1
parte2 = spr_wheel_11
parte3 = spr_wheel_12
parte4 = spr_wheel_13