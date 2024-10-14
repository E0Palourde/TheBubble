if (place_meeting(x,y,LaBulle)){
	player_hit = true;
}
else{
	player_hit = false;
}

if (player_hit == true && alpha > 0.6){
	alpha-= 0.025;
}
else{
	if (alpha<1){
		alpha+= 0.025;
	}
}

if (place_meeting(x-64,y,LaBulle)){
	LaBulle.image_index = 1;
}