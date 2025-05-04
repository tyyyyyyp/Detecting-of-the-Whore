// Room Start Event
if (!instance_exists(obj_player_2)) {
    // Координати, де має з'явитися персонаж
    var start_x = 700;
    var start_y = 1770;
    var player_instance = instance_create_layer(start_x, start_y, "Effects", obj_player_2);  // Створюємо персонажа в стартовій позиції
}
