switch (state) {
    case "fade_in":
        alpha -= 0.02;
        if (alpha <= 0) {
            alpha = 0;
            state = "showing";
        }
        break;

    case "showing":
        // Плавне пересування тексту
        text_x = lerp(text_x, target_x, 0.05);

        // Час до наступного слова
        text_timer += 1;
        if (text_timer > 180) {
            text_timer = 0;
            text_index += 1;
            if (text_index >= array_length(texts)) {
                state = "fade_out"; // Переходимо до зникнення тексту
            } else {
                text_x = display_get_width(); // Скидаємо позицію для наступного тексту
            }
        }
        break;

    case "fade_out":
        alpha += 0.02;
        if (alpha >= 1) {
            alpha = 1;
            state = "done"; // Завершення катсцени
            room_goto(rm_gost); // Перехід до кімнати rm_gost

            // Створення об'єкта obj_player_2 на шарі "Effects" на координатах (383, 225)
            instance_create_layer(383, 225, "Effects", obj_player_2);
        }
        break;
}

