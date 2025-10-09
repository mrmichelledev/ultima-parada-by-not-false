function collision(){
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position
	
	x = xprevious;
	y = yprevious;
	
	//get distance we want to move
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);
	
	//move as far as possible in x and y before hitting solid
	repeat(_disx){
		if((!place_meeting(x + sign(_tx - x), y, obj_solid))){
			x += sign(_tx - x);		
		}
	}
	repeat(_disy){
		if(!(place_meeting(x, y + sign(_ty - y), obj_solid))){
			y += sign(_ty - y);
		}
	}
}