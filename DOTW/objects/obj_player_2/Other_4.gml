// Room Start Event
if (!instance_exists(obj_player_2)) {
    // Координати, де має з'явитися персонаж
    var start_x = 700;
    var start_y = 1770;
    var player_instance = instance_create_layer(start_x, start_y, "Effects", obj_player_2);  // Створюємо персонажа в стартовій позиції
}
// Безпечне встановлення координат гравця з глобальних змінних

if (variable_global_exists("saved_player_x") && variable_global_exists("saved_player_y")) {
    if (is_real(global.saved_player_x) && is_real(global.saved_player_y)) {
        x = global.saved_player_x;
        y = global.saved_player_y;

        // Скидаємо значення, щоб не використовувати їх повторно помилково
        global.saved_player_x = undefined;
        global.saved_player_y = undefined;
    }
}

