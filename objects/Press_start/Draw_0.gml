// Définir la police
draw_set_font(fnt_menu);

// Définir la couleur du texte en jaune
draw_set_color(c_yellow);

var x_position = display_get_width() / 5;
var y_position = display_get_height() / 4;

// Définir le texte à afficher
var text_to_display = "PRESS SPACE";

// Dessiner le texte
draw_text_transformed(x_position, y_position, text_to_display,0.5,0.5,0);
