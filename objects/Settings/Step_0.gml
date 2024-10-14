if (keyboard_check_pressed(vk_escape)) {
    // Basculer entre plein écran et fenêtre
    global.fullscreen = !window_get_fullscreen();
    window_set_fullscreen(global.fullscreen);
}