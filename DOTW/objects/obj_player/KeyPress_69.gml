 // Дебаг: вивести відстань до obj_trigger
show_debug_message("Distance: " + string(distance_to_object(obj_trigger)));

// Перевірка, чи персонаж поруч з obj_trigger
if (keyboard_check_pressed(ord("E"))) {
    if (distance_to_object(obj_trigger) < 50) { // 50 - максимальна відстань
        instance_create_depth(x, y, 0, obj_fade); // Створюємо об'єкт затемнення
    }
}
 