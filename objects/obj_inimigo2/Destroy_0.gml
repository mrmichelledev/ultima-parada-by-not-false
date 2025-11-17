partNumber = random_range(5, 15);

repeat(partNumber){
	instance_create_layer(x+random_range(-2, 2), y-8, "instances", obj_particula)
}

