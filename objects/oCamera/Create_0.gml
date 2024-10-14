//window_set_size(1080,1080);

camWidth = 640; // 640
camHeight = 720; // 360

if instance_exists(LaBulle){
	follow = LaBulle;
}
else
if instance_exists(Titre){
	follow = Titre;
}
xTo = follow.x;
yTo = y;