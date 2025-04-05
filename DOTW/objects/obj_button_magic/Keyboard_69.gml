if (keyboard_check_pressed(ord("E")))
 if (distance_to_object(obj_trigger) < 50) {
    // Знаходимо ворога в межах певної області або на місці кліку
    var target = instance_place(mouse_x, mouse_y, obj_enemy);
    
    if (target != noone) {
        // Якщо ворог знайдений, віднімаємо 10 HP
        target.hp -= 10; // Віднімаємо 10 здоров'я
        show_message("Ворог отримав удар! Здоров'я: " + string(target.hp));
    }
}
