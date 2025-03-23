// Перевірка на відстань між гравцем та об'єктом
if (point_distance(obj_player.x, obj_player.y, x, y) < 100 && keyboard_check_pressed(ord("E"))) {
    text_time = 0;  // Починаємо відлік часу з моменту натискання клавіші
    current_char = 0;  // Починаємо з першого символа
    text_display_time = -1;  // Скидаємо таймер для затримки після появи
}

// Оновлюємо таймер і показуємо символи по черзі
if (text_time != -1 && text_time < 10 * room_speed) {
    if (text_time mod 5 == 0) {  // Кожні 5 кадрів додаємо по одному символу
        current_char += 1;
    }
    
    text_time += 1;  // Оновлюємо таймер
}

// Коли весь текст вже відображено, запускаємо таймер для затримки
if (current_char == string_length(text_to_show) && text_display_time == -1) {
    text_display_time = current_time;  // Починаємо відлік часу після появи тексту
}

// Якщо пройшло 3 секунди після повного появлення тексту, сховати його
if (text_display_time != -1 && current_time - text_display_time > 30 * room_speed) {
    text_time = -1;  // Приховуємо текст
    current_char = 0;  // Скидаємо позицію символа
}

// Встановлюємо шрифт перед відображенням тексту
draw_set_font(Font1);  // Встановлюємо шрифт Font1

// Відображаємо частину тексту
draw_text(x + 100, y - 100, string_copy(text_to_show, 1, current_char));

