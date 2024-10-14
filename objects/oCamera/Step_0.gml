if (follow != noone)
{
	xTo = follow.x-(camWidth*0.5)+250;
	yTo = 0
	//yTo = follow.y;
}

x += (xTo - x)/10;
//y += (yTo - y)/25;

//camera_set_view_pos(view_camera[0],x-(camWidth*0.5),y-(camHeight*0.5));
camera_set_view_pos(view_camera[0],x-(camWidth*0.5),100);

//désactiver tout ce qui est off-screen
/*
instance_deactivate_region(x - 64,-1000, x + 128, 2000, false, true); //deactiveate all outside view with a 64 border
instance_activate_object(LaBulle);
instance_activate_object(Settings);
instance_activate_object(Timer);
instance_activate_object(Niveau1);
instance_activate_region(x - 64,-1000, x + 128, 2000, false);
*/