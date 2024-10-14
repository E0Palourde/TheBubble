audio_play_sound(0,1,true)
size = 1; // avant : 4
background_width = 2400 * size;
x_position = 0;
y_position = obj_background1.y;
flip = 1;

// Tant qu'on n'a pas couvert toute la largeur de la room
while (x_position < room_width) {
    // Créer une instance de l'objet arrière-plan à la position actuelle
    var _instance = instance_create_layer(x_position, y_position, "Instances", obj_background1);
    
    // Déplacer la position x pour coller le prochain objet à l'extrémité du précédent
    x_position += background_width;
	
	_instance.image_xscale = size * flip;
    _instance.image_yscale = size;
        
    // Alterner le retournement pour la prochaine instance
    flip = -flip; // Inverse le signe de `flip`
}

