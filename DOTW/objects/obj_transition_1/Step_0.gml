
if place_meeting(x,y, obj_player_2){
if (transition_in) {
    // Плавно збільшуємо прозорість для затемнення екрана
    alpha += speed;
    if (alpha >= 1) {
        alpha = 1;  // Як тільки екран повністю затемнений, припиняємо збільшення прозорості
        transition_in = false;  // Тепер почнемо перехід між кімнатами
        room_goto(target_rm);
		obj_player_2.x = target_x;
		obj_player_2.y = target_y;
  
  }
} else if (transition_out) {
    // Плавно зменшуємо прозорість для освітлення екрана після переходу
    alpha -= speed;
    if (alpha <= 0) {
        alpha = 0;  // Як тільки екран повністю прозорий, припиняємо змінювати прозорість
    }
}
//step event
}