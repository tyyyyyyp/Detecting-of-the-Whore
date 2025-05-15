if (place_meeting(x, y, obj_soul) && room_speed * 90) {
    if (transition_in) {
        alpha += speed;
        if (alpha >= 1) {
            alpha = 1;
            transition_in = false;
			
            // Видаляємо об'єкт перед переходом
            instance_destroy(obj_soul); 
			
            room_goto(target_rm);
			instance_create_layer(target_x,target_y,"Effects",obj_player_2)
        }
    } else if (transition_out) {
        alpha -= speed;
        if (alpha <= 0) {
            alpha = 0;
        }
    }
}
if (start_move) {
    // Цільові координати
    var tx = 800;
    var ty = 400;

    // Швидкість руху (уникаємо "speed")
    var move_speed = 4;

    // Вектор до цілі
    var dx = tx - x;
    var dy = ty - y;
    var dist = point_distance(x, y, tx, ty);

    // Рух
    if (dist > 1) {
        x += dx / dist * move_speed;
        y += dy / dist * move_speed;
    } else {
        start_move = false; // Зупиняємось
    }
}
