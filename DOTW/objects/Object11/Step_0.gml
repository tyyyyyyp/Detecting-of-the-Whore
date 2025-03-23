// Якщо натискається клавіша 'E' і відстань до об'єкта менша за 100
if (point_distance(obj_player.x, obj_player.y, x, y) < 100 && keyboard_check_pressed(ord("E"))) {
    text_time = 0;  // Починаємо відлік часу з моменту натискання клавіші
}
