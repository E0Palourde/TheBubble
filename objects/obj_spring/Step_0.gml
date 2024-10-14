if (place_meeting(x,y-10,LaBulle) && hit_player == false){
	image_index = 1;
	image_speed = 0.5;
	timer = initial_timer;
	hit_player = true;
}

if timer > 0 && hit_player = true{
	timer--;
}
else{
	image_speed = 0;
	hit_player = false;
	image_index = 0;
}