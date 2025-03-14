// Малюємо чорний екран з глобальним рівнем прозорості
draw_set_color(c_black); // Чорний колір
draw_set_alpha(global.fade_alpha); // Встановлюємо глобальну прозорість
draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Малюємо чорний прямокутник на весь екран
