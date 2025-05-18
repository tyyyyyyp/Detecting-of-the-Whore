// Стани
state = "fade_in"; // Може бути: fade_in, showing, fade_out, done

// Прозорість екрана
alpha = 1.0;

// Таймер для тексту
text_timer = 0;
text_index = 0;
texts = ["HELLO!", "Today i show you my story!", "So listen!"];

// Позиція тексту
text_x = display_get_width(); // Починає праворуч
target_x = display_get_width() / 2;
