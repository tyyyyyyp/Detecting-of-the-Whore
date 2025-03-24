// Перевіряємо, чи існує об'єкт гравця
if (instance_exists(obj_player_2)) {
    var dist_back = point_distance(x, y, obj_player_2.x, obj_player_2.y);

    // Перевірка, чи знаходиться гравець в межах 100 пікселів від тригера
    if (dist_back <= 100) {
        // Створюємо об'єкт для ефекту переходу
        instance_create_layer(0, 0, "Instances", obj_transition);
        
        // Активуємо плавний перехід
        global.transition_done = false;
    }
}
