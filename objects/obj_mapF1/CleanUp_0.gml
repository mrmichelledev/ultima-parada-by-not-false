//limpando as grades quando não usadas
if(ds_exists(grade, ds_type_grid))
	ds_grid_destroy(grade)