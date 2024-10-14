// Gérer l'accélération et la direction
h_direction = keyboard_check(vk_right) - keyboard_check(vk_left); // 1 pour droite, -1 pour gauche, 0 sinon
if (h_direction != 0) {
    image_angle += (-move_speed +(-h_direction * rotation_speed))/2;
}


// Appliquer l'accélération en fonction de la direction

if time_since_grounded >0{
	if (h_direction != 0) {
	    move_speed += acceleration * h_direction;
	    if (abs(move_speed) > max_speed) {
	        move_speed = max_speed * h_direction;
	    }
	} else {
	    // Appliquer la friction lorsque aucune touche n'est pressée
	    if (move_speed > 0) {
			image_angle -= move_speed;
	        move_speed -= _friction;
	        if (move_speed < 0) {
	            move_speed = 0;
	        }
	    } else if (move_speed < 0) {
	        move_speed += _friction;
			image_angle -= move_speed;
	        if (move_speed > 0) {
	            move_speed = 0;
	        }
	    }
	}
}

if time_since_grounded<3{
	if (h_direction != 0) {
		if sign(h_direction) == sign(move_speed){
			move_speed += air_acceleration * h_direction;
		    if (abs(move_speed) > max_speed) {
		        move_speed = max_speed * h_direction;
				}
		}
		else{
		    move_speed += (air_acceleration * h_direction) * 0.75;
		}
	} else {
	    // Appliquer la friction lorsque aucune touche n'est pressée
	    if (move_speed > 0) {
			image_angle -= move_speed;
	        move_speed -= air_friction;
	        if (move_speed < 0) {
	            move_speed = 0;
	        }
	    } else if (move_speed < 0) {
	        move_speed += air_friction;
			image_angle -= move_speed;
	        if (move_speed > 0) {
	            move_speed = 0;
	        }
	    }
	}
}

// Mettre à jour la position du personnage

x += move_speed;




// gravité

/*
if (place_meeting(x+16,y+23,obj_ground) && (place_meeting(x+1,y,obj_wall_right))){
	var _ground_instance_2 = instance_place(x+move_speed, y+1, obj_ground);
	var _wall_instance = instance_place(x+move_speed, y, obj_wall_right);
	if (_wall_instance != noone && _ground_instance_2 != noone){
		_wall_y = _wall_instance.y;
		_ground_y2 = _ground_instance_2.y;
		if (_wall_y > _ground_y2 && y < _ground_y2 && _vspeed >= 0) {
			x=_wall_instance.x-46;
			_vspeed =0;
		}
	}
}
if (place_meeting(x-16,y+23,obj_ground) && (place_meeting(x-1,y,obj_wall_left))){
	var _ground_instance_2 = instance_place(x+move_speed, y+1, obj_ground);
	var _wall_instance = instance_place(x+move_speed, y, obj_wall_left);
	if (_wall_instance != noone && _ground_instance_2 != noone){
		_wall_y = _wall_instance.y;
		_ground_y2 = _ground_instance_2.y;
		if (_wall_y > _ground_y2 && y < _ground_y2 && _vspeed >= 0) {
			x=_wall_instance.x+46;
			_vspeed =0;
		}
	}
}
*/
/*
if (place_meeting(x,y,obj_ground)){
	y-=0.5;
}
*/

// variables d'instances
var _roof_instance = instance_place(x, y + _vspeed, obj_roof); 
var _ground_instance = instance_place(x, y+1+ _vspeed, obj_ground);
var _rightwall_instance = instance_place(x, y+1+ _vspeed, obj_wall_right);
var _leftwall_instance = instance_place(x, y+1+ _vspeed, obj_wall_left);

if (_roof_instance != noone && _vspeed < 0) {
	_roof_y = _roof_instance.y;
	_delta = y + _vspeed + (_roof_y -32); // Calcule l'écart par rapport au sol après chute
	if (_delta >= _vspeed && _vspeed<0) {
		y = _roof_y+30;
		_vspeed = 5;
		time_since_grounded = 0;
	}
}
_roof_instance = noone;
_delta = 0;


if ((_ground_instance != noone && _rightwall_instance != noone) && (_ground_instance.x>x)){
	y-=0.5;
}
if ((_ground_instance != noone && _leftwall_instance != noone) && (_ground_instance.x<x)){
	y-=0.5;
}


if (!place_meeting(x, y+1, obj_ground) || _vspeed < 0){	
	// Si le personnage dépasse le sol, ajuste sa position

	if (_ground_instance != noone && _vspeed >= 0) {
	    // Si une instance de sol est trouvée, récupère sa position Y
	    _ground_y = _ground_instance.y;
		_delta = y + _vspeed - (_ground_y -32); // Calcule l'écart par rapport au sol après chute
		//show_message("écart: "+string(_delta)+" y: "+string(y+_vspeed)+" gy: "+string(_ground_y-32)+" vs: "+string(_vspeed));
		if (_delta <= _vspeed && _vspeed>0) {
			y = _ground_y-30;
			_vspeed = 0;
			_delta = 0;
			is_fastfalling = false;
			fastfall_buffer = 0;
		}
	}
	else {
		if ((_vspeed <= 10) || (_vspeed <= 20 && is_fastfalling)) {
			if _vspeed <= 0 {
				_vspeed += _gravity;
			}
			else {
				if !(is_fastfalling){ _vspeed += _gravity*2;}
				else{
					if (_ground_instance != noone && _vspeed >= 0) {
						// Si une instance de sol est trouvée, récupère sa position Y
						_ground_y = _ground_instance.y;
						_delta = y + _vspeed - (_ground_y -32); // Calcule l'écart par rapport au sol après chute
						//show_message("écart: "+string(_delta)+" y: "+string(y+_vspeed)+" gy: "+string(_ground_y-32)+" vs: "+string(_vspeed));
						if (_delta <= _vspeed && _vspeed>0) {
							y = _ground_y-30;
							_vspeed = 0;
							_delta = 0;
							is_fastfalling = false;
							fastfall_buffer = 0;
						}
					}
					else{
						_vspeed = 20;
					}
				}
		}
	}
	// Déplacer l'objet verticalement en fonction de sa vitesse
	y += _vspeed;
	_ground_instance = noone;
	}
}
else
{
	_vspeed = 0;
	is_fastfalling = false;
	// Sauter après avoir quitté le sol
	time_since_grounded = time_since_grounded_max;
}

// Vérification si le personnage est au sol
if ((place_meeting(x, y+2, obj_ground) || time_since_grounded>0) && (jump_buffer > 0 && _vspeed>=0)) {

    _vspeed = -13;
    y -= 2;
	jump_buffer = 0;  // Réinitialise le buffer après le saut
	is_fastfalling = false;

}

// Fastfall avec buffer

	// Vérification de l'appui sur la touche Espace et mise à jour du buffer
	if (keyboard_check_pressed(vk_down)) {
	    fastfall_buffer = fastfall_buffer_max;  // Si le joueur appuie sur Espace, on active le buffer
	}

	// Diminution du buffer à chaque frame
	if (fastfall_buffer > 0) {
	    fastfall_buffer--;  // Diminue le buffer à chaque frame
	}
// Saut avec buffer

	// Vérification de l'appui sur la touche Espace et mise à jour du buffer
	if (keyboard_check_pressed(vk_space)) {
	    jump_buffer = jump_buffer_max;  // Si le joueur appuie sur Espace, on active le buffer
	}

	// Diminution du buffer à chaque frame
	if (jump_buffer > 0) {
	    jump_buffer--;  // Diminue le buffer à chaque frame
	}
	// Diminution du temps écoulé après avoir touché le sol
	if (time_since_grounded > 0) {
		time_since_grounded--;
	}
	
	
	if (fastfall_buffer>0 && _vspeed>0){
	is_fastfalling = true;
}
	
/*
// Gérer les collisions avec les murs
if (place_meeting(x, y, obj_wall_right) && move_speed>0) {
	move_speed = 0;
	x-=acceleration;
}

if (place_meeting(x, y, obj_wall_left) && move_speed<0) {
	move_speed = 0;
	x+=acceleration;
}
*/
// Vérifie le mur à droite
if (place_meeting(x + move_speed, y, obj_wall_right) && move_speed > 0) {
    move_contact_solid(0, move_speed);  // Se déplace dans la direction de droite (0°) jusqu'à juste avant le mur
    move_speed = 0;  // Arrête le mouvement
	x-=acceleration;
}

// Vérifie le mur à gauche
if (place_meeting(x + move_speed, y, obj_wall_left) && move_speed < 0) {
    move_contact_solid(180, move_speed);  // Se déplace dans la direction de gauche (180°) jusqu'à juste avant le mur
    move_speed = 0;  // Arrête le mouvement
	x+=acceleration;
}


//PowerUps

//Fast
if (place_meeting(x,y,obj_power_up_fast)){
	max_speed = 20;
	acceleration = 2;
	start_timer = true;
	timer = 60 * 4;
}
	

if (timer > 0) {timer--;}

if (timer == 0){
	max_speed = 10;
	acceleration = 1;
	friction = 0.8;

	timer = -1;
}

// vie
if _health == 0 {
	visible = false;
	audio_stop_sound(0);
	max_speed = 0;
	room_goto(MainMenu)
	global.timer = -1;
}

if place_meeting(x,y,obj_piquant){
	_health = 0;
}

if place_meeting(x,y,obj_death_trigger){
	_health = 0;
}

if place_meeting(x,y,obj_spring){
	_vspeed = -20;
	is_fastfalling = false;
}


// fin niveau

if place_meeting(x,y,EndTrigger)
{
	if ((global.timer < global.lowest_time) && (global.timer > 0)){
		global.lowest_time = global.timer;
	}
	audio_stop_sound(0);
	room_goto(MainMenu);
}

// à supp
if (keyboard_check_pressed(ord("A"))){
	friction -= 0.1;
}
if (keyboard_check_pressed(ord("Z"))){
	friction += 0.1;
}
if (keyboard_check_pressed(ord("Q"))){
	acceleration -= 0.1;
}
if (keyboard_check_pressed(ord("S"))){
	acceleration += 0.1;
}