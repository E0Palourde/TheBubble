//indice 
i = 0;

// Ajustement ordonnée/abscisse
_delta = 0;
_ground_y = 0;
_ground_y2 = 0;
_wall_y = 0;
_roof_y = 0;

//Constantes
rotation_speed = 10;
size = 2;
max_health = 1;
_health = max_health;
depth = -100;
//image_index = 0;

// Variables de mouvement
move_speed = 0;
max_speed = 10; // 10
acceleration = 1; // 1
air_acceleration = 1; // 0.5
_friction = 0.8;  // 0.8
air_friction = 0.8; // 0.2

// Variables de direction
h_direction = 0; // 1 pour droite, -1 pour gauche, 0 pour aucun mouvement horizontal



// Taille par défaut
image_xscale = size;
image_yscale = size;

// Gravité
_gravity = 0.5;      // Accélération due à la gravité
_vspeed = 0;         // Vitesse verticale initiale

// Variable pour le timer
start_timer = false
timer = -1

// Buffer 
jump_buffer_max = 10; // Durée du buffer de saut (en frames)
jump_buffer = 0;      // Compteur pour le buffer
time_since_grounded = 0; // Sauter après avoir quitté le sol
time_since_grounded_max = 5;
fastfall_buffer_max = 15; // Fastfall 15
fastfall_buffer = 0;
is_fastfalling = false;

if (instance_exists(SpawnPoint)){
	x=SpawnPoint.x;
	y=SpawnPoint.y;
}