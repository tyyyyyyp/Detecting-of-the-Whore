if (global.inventory_open) {
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(50, 50, 300, 300, false);

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(90, 60, "inventory:");

    for (var i = 0; i < array_length(global.inventory); i++) {
        if (i == global.inventory_index) {
            draw_set_color(c_lime); // Виділений предмет
        } else {
            draw_set_color(c_white);
        }
        draw_text(100, 80 + i * 20, string(global.inventory[i]));
    }
}
