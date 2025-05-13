if (place_meeting(x, y, obj_player_2) && room_speed * 90) {
    if (transition_in) {
        alpha += speed;
        if (alpha >= 1) {
            alpha = 1;
            transition_in = false;
			
            // Видаляємо об'єкт перед переходом
            instance_destroy(obj_player_2); 
			
            room_goto(target_rm);
        }
    } else if (transition_out) {
        alpha -= speed;
        if (alpha <= 0) {
            alpha = 0;
        }
    }
}
