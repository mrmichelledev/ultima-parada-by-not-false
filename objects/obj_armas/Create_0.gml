//sem armas
armas[0] = ds_map_create()
ds_map_add(armas[0], "sprite", -1)
ds_map_add(armas[0], "projetil", -1)
ds_map_add(armas[0], "muzzle", -1)
ds_map_add(armas[0], "xProjetil", 0)
ds_map_add(armas[0], "yProjetil", 0)
ds_map_add(armas[0], "municao", 0)
ds_map_add(armas[0], "som", sn_notammo)
ds_map_add(armas[0], "velocidade", 0)
ds_map_add(armas[0], "recuo", 0)
ds_map_add(armas[0], "dano", 0)
ds_map_add(armas[0], "delay", 0)
ds_map_add(armas[0], "automatico", false)
ds_map_add(armas[0], "drop", -1)
ds_map_add(armas[0], "desbloqueada", false)


//pistola
armas[1] = ds_map_create()
ds_map_add(armas[1], "sprite", spr_pistola)
ds_map_add(armas[1], "projetil", spr_pistolB)
ds_map_add(armas[1], "muzzle", m_11)
ds_map_add(armas[1], "xProjetil", 38)
ds_map_add(armas[1], "yProjetil", 1)
ds_map_add(armas[1], "municao", 50)
ds_map_add(armas[1], "som", sn_Pistola)
ds_map_add(armas[1], "velocidade", 10)
ds_map_add(armas[1], "recuo", 5)
ds_map_add(armas[1], "dano", 10)
ds_map_add(armas[1], "delay", 20)
ds_map_add(armas[1], "automatico", false)
ds_map_add(armas[1], "drop", obj_pistola)
ds_map_add(armas[1], "desbloqueada", true)

//escopeta
armas[2] = ds_map_create()
ds_map_add(armas[2], "sprite", spr_escopeta)
ds_map_add(armas[2], "projetil", spr_pistolB)
ds_map_add(armas[2], "muzzle", m_6)
ds_map_add(armas[2], "xProjetil", 59)
ds_map_add(armas[2], "yProjetil", 9)
ds_map_add(armas[2], "municao", 30)
ds_map_add(armas[2], "som", sn_Escopeta)
ds_map_add(armas[2], "velocidade", 8)
ds_map_add(armas[2], "recuo", 30)
ds_map_add(armas[2], "dano", 20)
ds_map_add(armas[2], "delay", 40)
ds_map_add(armas[2], "automatico", false)
ds_map_add(armas[2], "drop", obj_escopeta)
ds_map_add(armas[2], "desbloqueada", true)

//metralhadora
armas[3] = ds_map_create()
ds_map_add(armas[3], "sprite", spr_metralhadora)
ds_map_add(armas[3], "projetil", spr_pistolB)
ds_map_add(armas[3], "muzzle", m_12)
ds_map_add(armas[3], "xProjetil", 65)
ds_map_add(armas[3], "yProjetil", 11)
ds_map_add(armas[3], "municao", 100)
ds_map_add(armas[3], "som", sn_Metralhadora)
ds_map_add(armas[3], "velocidade", 12)
ds_map_add(armas[3], "recuo", 10)
ds_map_add(armas[3], "dano", 5)
ds_map_add(armas[3], "delay", 5)
ds_map_add(armas[3], "automatico", true)
ds_map_add(armas[3], "drop", obj_metralhadora)
ds_map_add(armas[3], "desbloqueada", true)

//bazuka
armas[4] = ds_map_create()
ds_map_add(armas[4], "sprite", spr_bazuka)
ds_map_add(armas[4], "projetil", spr_bazukaB)
ds_map_add(armas[4], "muzzle", m_11)
ds_map_add(armas[4], "xProjetil", 40)
ds_map_add(armas[4], "yProjetil", 0)
ds_map_add(armas[4], "municao", 5)
ds_map_add(armas[4], "som", sn_Bazuca)
ds_map_add(armas[4], "velocidade", 20)
ds_map_add(armas[4], "recuo", 30)
ds_map_add(armas[4], "dano", 100)
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
recuo_atual  = 0
atirarOn     = true


sTroca_Arma(self, 0)

municao_atual = municao

//scrollar as armas
max_armas = 4
i_armas = arma_atual

//menu circular
mostrar_menu = false
parte1 = spr_wheel_se2
parte2 = spr_wheel_unk1
parte3 = spr_wheel_unk3
parte4 = spr_wheel_unk4