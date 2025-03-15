if (keyboard_check_pressed(ord("E"))) {
    // Перевірка, чи персонаж поруч з obj_trigger
    if (distance_to_object(obj_trigger) < 50) { // 50 - це максимальна відстань, при якій можна взаємодіяти
        instance_create_depth(x, y, 0, obj_fade); // Створюємо об'єкт затемнення
    }
}
 