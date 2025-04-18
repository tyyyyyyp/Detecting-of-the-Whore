// Ініціалізація змінних для таймера
if (!initialized) {
    scene_time = 0; // Лічильник часу
    finished = false; // Катсцена ще не завершена
    initialized = true; // Забезпечуємо, щоб ініціалізація відбулась лише один раз
}

// Малювання елементів катсцени
if (!finished) {
    // Ваші анімації або інші елементи катсцени
    alpha += 0.01; // Плавне збільшення прозорості
    if (alpha > 1) {
        alpha = 1; // Обмежуємо прозорість до 1
    }

    // Малювання анімованого спрайта
    draw_set_alpha(alpha);
    draw_sprite(cutscene, 0, 320, 240); // Малюємо спрайт на екрані

    // Анімація тексту (наприклад, зміна прозорості)
    var text_alpha = min(alpha, 1); // Текст анімується разом з прозорістю
    draw_set_alpha(text_alpha);
    draw_set_color(c_white);
    draw_text(320, 400, "Це текст катсцени");

    // Збільшення лічильника часу
    scene_time += 1; // Лічильник часу

    // Перевірка на завершення катсцени через 15 секунд
    if (scene_time > room_speed * 15) { // room_speed — це кількість кадрів за секунду, *15 дає 15 секунд
        finished = true; // Катсцена завершена
    }
} else {
    // Катсцена завершена, можна малювати повідомлення або робити інші дії
    draw_set_alpha(1); // Повна прозорість
    draw_text(320, 400, "Катсцена завершена");

    // Таймер для переходу до іншої кімнати
    scene_time += 1;
    if (scene_time > room_speed) { // 1 кадр після завершення катсцени (приблизно)
        room_goto(rm_gost); // Перехід до наступної кімнати
    }
}
