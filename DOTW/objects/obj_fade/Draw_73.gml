// Малюємо чорний прямокутник поверх усіх об'єктів
draw_set_alpha(global.fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false); // Прямокутник, що покриває весь екран
draw_set_alpha(1); // Скидаємо альфа значення після малювання
