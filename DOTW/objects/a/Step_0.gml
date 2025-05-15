// Починаємо показ тексту, коли гравець близько і натискає E
if (!showing_text && point_distance(obj_player_2.x, obj_player_2.y, x, y) < 100 && keyboard_check_pressed(ord("E"))) {
    showing_text = true;
    text_time = 0;
    current_char = 0;
    current_line = 0;
    text_display_time = -1;
}

// Якщо показ тексту активний
if (showing_text && text_time != -1 && current_line < array_length(text_lines)) {
    // Посимвольне наближення тексту
    if (text_time mod 5 == 0 && current_char < string_length(text_lines[current_line])) {
        current_char += 1;
    }

    text_time += 1;

    // Коли весь рядок показано — чекаємо перед наступним
    if (current_char == string_length(text_lines[current_line]) && text_display_time == -1) {
        text_display_time = current_time;
    }

    // Переходимо до наступного рядка після затримки
    if (text_display_time != -1 && current_time - text_display_time > line_delay) {
        current_line += 1;
        if (current_line < array_length(text_lines)) {
            current_char = 0;
            text_time = 0;
            text_display_time = -1;
        } else {
            // Завершено — скидаємо
            showing_text = false;
            text_time = -1;
            current_char = 0;
        }
    }
}
