// Ініціалізація глобальних змінних при старті
global.text_string = "This is a new message.";  // Текст для відображення
global.current_char = 0;  // Індекс поточної букви
global.text_speed = 0.1;   // Затримка між буквами (від 0 до 1, де 0 — швидко, а 1 — повільно)
global.last_time = 0;      // Час останнього оновлення



// Масив текстів для виводу
global.text_array = ["one.", "two.", "four!", "jony go"];
global.current_text_index = 0; // Індекс поточного тексту
global.text_string = global.text_array[global.current_text_index]; // Поточний текст
global.current_char = 0; // Скільки символів показано
global.text_timer = -1; // Таймер очікування (-1 означає, що він ще не активний)
global.text_speed = 0.05; // Швидкість друку (секунд на символ)
global.last_time = current_time; // Час останнього оновлення тексту
 