if image_index = 0 and ( keyboard_check_pressed(ord("E"))){
image_index = 1;	
} else if image_index = 1 and  ( keyboard_check(ord("D"))){
	image_index = 2;
} else if image_index = 2 and  ( keyboard_check(ord("A"))){
image_index = 1;	
} else if image_index = 1 and  ( keyboard_check_pressed(ord("E"))){
room_goto(startRoom);
var inst = instance_create_layer(startX,startY,"player", obj_player_2)

} else if image_index == 2 and keyboard_check_pressed(ord("E")) {
    var file_name = "save.sav";
    if (file_exists(file_name)) {
        file_delete(file_name);
    }

    // Повністю перезапускаємо гру
    game_restart();
}
