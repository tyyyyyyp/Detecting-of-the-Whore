

// Зміна спрайтів і обробка натискання клавіші E
if (image_index == 0 and keyboard_check_pressed(ord("E"))) {
    image_index = 1;
} else if (image_index == 1 and keyboard_check(ord("D"))) {
    image_index = 2;
} else if (image_index == 2 and keyboard_check(ord("A"))) {
    image_index = 1;
} else if (image_index == 1 and keyboard_check_pressed(ord("E"))) {
    // Переходить до кімнати, де була збережена інформація
    room_goto(startRoom);  // переходимо в кімнату, яка збережена
    var inst = instance_create_layer(startX, startY, "player", obj_player_2);  // створюємо нового гравця на збережених координатах
} else if (image_index == 2 and keyboard_check_pressed(ord("E"))) {
    // Якщо спрайт == 2, перезапускаємо гру
    var file_name = "save.sav";
    if (file_exists(file_name)) {
        file_delete(file_name);  // видаляємо файл збереження
    }

    // Перезапускаємо гру
    game_restart();
}
