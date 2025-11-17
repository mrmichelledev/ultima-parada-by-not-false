if (instance_exists(dono)) {
	dono.vida_atual = dono.gerenciador_vida.perde_vida(obj_armas.dano)
	dono.alfa = 1
	sScreen_Shake(5, 5)
}