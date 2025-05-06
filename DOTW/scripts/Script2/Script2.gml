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

    // Зберігаємо кількість використаних предметів
    file_text_write_real(file, array_length(global.used_items));
    file_text_writeln(file);

    // Зберігаємо самі назви використаних предметів
    for (var i = 0; i < array_length(global.used_items); i++) {
        file_text_write_string(file, global.used_items[i]);
        file_text_writeln(file);
    }

    file_text_close(file);
}




function load_game()
{
    // Ініціалізація інвентаря
    if (!is_array(global.inventory)) {
        global.inventory = array_create(8, 0);
    }

    // Ініціалізація підібраних предметів
    if (!variable_global_exists("items_picked")) {
        global.items_picked = array_create(100, false);
    }

    // Ініціалізація використаних предметів
    if (!variable_global_exists("used_items")) {
        global.used_items = [];
    }

    if (file_exists("save.sav"))
    {
        var file = file_text_open_read("save.sav");

        // Координати гравця
        obj_player_2.x = file_text_read_real(file);
        file_text_readln(file);

        obj_player_2.y = file_text_read_real(file);
        file_text_readln(file);

        // Інвентар
        for (var i = 0; i < 8; i++) {
            global.inventory[i] = file_text_read_real(file);
            file_text_readln(file);
        }

        // Підібрані предмети
        for (var i = 0; i < array_length(global.items_picked); i++) {
            global.items_picked[i] = file_text_read_real(file);
            file_text_readln(file);
        }

        // Завантаження використаних предметів
        var used_count = file_text_read_real(file);
        file_text_readln(file);

        global.used_items = []; // очищаємо перед завантаженням

        for (var i = 0; i < used_count; i++) {
            var used_name = file_text_read_string(file);
            file_text_readln(file);
            array_push(global.used_items, used_name);
        }

        file_text_close(file);
    }
}
