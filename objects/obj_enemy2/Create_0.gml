
//arma
aim_dir = 0;
gun_dis = 11;


curr_state = IDLE;

anim_state = IDLE;

x_origin = x;
y_origin = y;

//valor do hp
hp_max = 60;
hp = hp_max;

mv_spd = 1.1;

aggro = false;
aggro_dis = 140;

atk_range = aggro_dis;
optimal_dis = atk_range - 40;
atk_cd = 39;
atk_timer = atk_cd;
bullet_speed = 4;

detection_delay = 60;
detection_timer = 60;

aggro_delay = 240;
aggro_timer = aggro_delay;

action_time = 80;
time_passed = 80;

reposition_counter = 0;

//Recursos para caminhos
path_to_player = path_add();
path_to_origin = path_add();

//Delay para calcular o caminho
calc_path_delay = 30;

//Timer para quando calcularmos o caminho
calc_path_timer = irandom(60);

//Delay para checar a direção do movimento
check_dir_delay = 30
check_dir_timer = check_dir_delay;

//Índice da direção (posição no array)
dir_index = 0;

//Criando matriz para armazenar as direções de movimento e seus pesos
directions = array_create(8, 0);
for(var i=0; i<8; i++){
	directions[i] = array_create(2, 0);
}

//Direções de movimento
directions[0][0] = point_direction(0, 0, 1, 0);
directions[1][0] = point_direction(0, 0, 1, -1);
directions[2][0] = point_direction(0, 0, 0, -1);
directions[3][0] = point_direction(0, 0, -1, -1);
directions[4][0] = point_direction(0, 0, -1, 0);
directions[5][0] = point_direction(0, 0, -1, 1);
directions[6][0] = point_direction(0, 0, 0, 1);
directions[7][0] = point_direction(0, 0, 1, 1); 

//Peso para as direções
for(var i=0; i<8; i++){
	directions[i][1] = 0;
}


