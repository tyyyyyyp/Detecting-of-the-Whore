// Малюємо чорний екран з відповідною прозорістю
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1);  // Повертаємо альфа-значення до 1
//draw event