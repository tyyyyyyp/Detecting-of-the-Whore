function save_game()
{
    var file = file_text_open_write("save.sav");

    // Зберігаємо координати гравця
    file_text_write_real(file, obj_player_2.x);
    file_text_writeln(file);
    file_text_write_real(file, obj_player_2.y);
    file_text_writeln(file);

    // Зберігаємо інвентар
    for (var i = 0; i < 8; i++) {
        file_text_write_real(file, global.inventory[i]);
        file_text_writeln(file);
    }

    // Зберігаємо інформацію про підібрані предмети
    for (var i = 0; i < 100; i++) {
        file_text_write_real(file, global.items_picked[i]);
        file_text_writeln(file);
    }

    file_text_close(file);
}



function load_game()
{
    // Ініціалізація інвентаря, якщо він ще не існує
    if (!is_array(global.inventory)) {
        global.inventory = array_create(8, 0); // 8 слотів по замовчуванню
    }

    // Ініціалізація масиву підібраних предметів
    if (!variable_global_exists("items_picked")) {
        global.items_picked = array_create(100, false); // Під 100 предметів
    }

    // Завантаження збереження
    if (file_exists("save.sav"))
    {
        var file = file_text_open_read("save.sav");

        // Координати гравця
        obj_player_2.x = file_text_read_real(file);
        file_text_readln(file);

        obj_player_2.y = file_text_read_real(file);
        file_text_readln(file);

        // Завантаження інвентаря
        for (var i = 0; i < 8; i++) {
            global.inventory[i] = file_text_read_real(file);
            file_text_readln(file);
        }

        // Завантаження інформації про підібрані предмети
        for (var i = 0; i < array_length(global.items_picked); i++) {
            global.items_picked[i] = file_text_read_real(file);
            file_text_readln(file);
        }

        file_text_close(file);
    }
}
