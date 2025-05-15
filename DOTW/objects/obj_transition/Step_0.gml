if (place_meeting(x, y, obj_player_2)) {
    if (transition_in) {
        alpha += speed;
        if (alpha >= 1) {
            alpha = 1;
            transition_in = false;
			
            // Знищити гравця
            instance_destroy(obj_player_2);

            // ПОМІТИТИ, що об’єкт використаний
            global.trigger_used = true;

            // Переходимо в іншу кімнату
            room_goto(target_rm);
        }
    } else if (transition_out) {
        alpha -= speed;
        if (alpha <= 0) {
            alpha = 0;
        }
    }
}
