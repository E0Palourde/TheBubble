// Définir la police
draw_set_font(fnt_menu);

// Définir la couleur du texte en jaune
draw_set_color(c_yellow);

var x_position = display_get_width() / 6;
var y_position = display_get_height() / 6;

// Définir le texte à afficher
var text_to_display = "The Bubble";

// Dessiner le texte
draw_text(x_position, y_position, text_to_display);

if (global.timer>0) {
    draw_text(300,600, "Temps actuel : "+string(global.timer/60));
}

if (global.lowest_time<999999) {
    draw_text(300,500, "Meilleur temps : "+string(global.lowest_time/60));
}
