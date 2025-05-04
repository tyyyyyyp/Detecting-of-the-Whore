// Просте меню з перемиканням спрайтів
if (image_index == 0 && keyboard_check_pressed(ord("E"))) {
    image_index = 1;
} else if (image_index == 1 && keyboard_check(ord("D"))) {
    image_index = 2;
} else if (image_index == 2 && keyboard_check(ord("A"))) {
    image_index = 1;
} else if (image_index == 1 && keyboard_check_pressed(ord("E"))) {
   room_goto(startr)
   var jjjj = instance_create_layer(startX,startY,"Effects",obj_player_2) 
   if (file_exists("save.sav")) {
        // Завантажити гру
        load_game();
   }
} else if (image_index == 2 && keyboard_check_pressed(ord("E"))) {
   if file_exists("save.sav"){
	   file_delete("save.sav")
   }
    game_restart(); // Перезапуск гри після очищення збереження
}
