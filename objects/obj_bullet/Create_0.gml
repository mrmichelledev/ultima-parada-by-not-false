dmg = 5;
range = 250;
owner_id = noone;

function bullet_die(){
	//O que acontece quando a bala é destruída
	
	speed = 0;
	instance_change(obj_bullet_explode, false);
}