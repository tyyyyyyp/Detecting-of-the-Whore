// Перевіряємо, чи гравець в зоні тригера
var dist_back = point_distance(x, y, obj_player_2.x, obj_player_2.y);

// Якщо відстань між тригером і гравцем менша або рівна 100 пікселів
if (dist_back <= 100) {
    // Встановлюємо флаг для активації переходу
    if (keyboard_check_pressed(vk_space)) {  // Можна змінити на іншу клавішу або спосіб активації
        // Створюємо об'єкт для ефекту переходу
        instance_create_layer(0, 0, "Instances", obj_transition);

        // Переходимо в попередню кімнату
        room_goto(global.previous_room);
    }
}
