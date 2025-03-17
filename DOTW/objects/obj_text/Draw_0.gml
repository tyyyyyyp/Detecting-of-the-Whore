// Встановлюємо шрифт
draw_set_font(Font1);

// Визначаємо позицію тексту (по центру по горизонталі та трохи вище від низу)
var x_pos = display_get_width() / 2 - string_width(global.text_string) / 2; // Центруємо текст по горизонталі
var y_pos = display_get_height() - 100; // Встановлюємо текст трохи вище від самого низу екрану

// Часова перевірка
if (global.current_char < string_length(global.text_string)) {
    // Перевіряємо, чи пройшло достатньо часу для відображення наступної букви
    if (current_time - global.last_time > global.text_speed * 1000) { // множимо на 1000, щоб час був у мілісекундах
        global.current_char += 1;  // Додаємо одну букву
        global.last_time = current_time;  // Оновлюємо час останнього відображення
    }
}

// Малюємо текст по літерах
var display_text = string_copy(global.text_string, 1, global.current_char);
draw_text(x_pos, y_pos, display_text);  // Використовуємо нові координати x_pos та y_pos для тексту

// Якщо натиснуто пробіл, відобразити весь текст одразу
if (keyboard_check_pressed(vk_space)) {
    global.current_char = string_length(global.text_string);
}
