// Встановлюємо шрифт
draw_set_font(Font1);

// Очищуємо область перед малюванням тексту
draw_clear_alpha(c_black, 0);

// Визначаємо розміри тексту
var text_width = string_width(global.text_string);
var text_height = string_height(global.text_string);

// Центруємо текст
var x_pos = (display_get_width() - text_width) / 2;
var y_pos = (display_get_height() - text_height) / 2;

// Часова перевірка (ефект друкарської машинки)
if (global.current_char < string_length(global.text_string)) {
    if (current_time - global.last_time > global.text_speed * 1000) { 
        global.current_char += 1;  
        global.last_time = current_time;  
    }
} else {
    // Якщо весь текст з’явився, запускаємо таймер перед наступним текстом
    if (global.text_timer == -1) {
        global.text_timer = current_time;  // Запам’ятовуємо час завершення
    } else if (current_time - global.text_timer > 2000) { // Чекаємо 2 секунди
        // Переходимо до наступного тексту
        global.current_text_index += 1;
        if (global.current_text_index < array_length(global.text_array)) {
            global.text_string = global.text_array[global.current_text_index];
            global.current_char = 0;
            global.text_timer = -1; // Скидаємо таймер
        }
    }
}

// Малюємо текст по літерах
var display_text = string_trim(string_copy(global.text_string, 1, global.current_char));
draw_text(x_pos, y_pos, display_text);

// Якщо натиснуто пробіл, показати весь текст одразу
if (keyboard_check_pressed(vk_space)) {
    global.current_char = string_length(global.text_string);
}
 