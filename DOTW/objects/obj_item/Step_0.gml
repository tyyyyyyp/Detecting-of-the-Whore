// Крок 1: Перевірка, чи предмет вже підібраний
if (global.items_picked[item_uid]) {
    instance_destroy(); // Якщо вже підібраний — зникає
    return; // Якщо вже підібраний, виходимо з функції, щоб не виконувалося подальше
}

// Крок 2: Перевірка, чи гравець поруч з предметом
if (place_meeting(x, y, obj_player_2)) {
    // Крок 3: Якщо натиснута клавіша E (для підбору)
    if (keyboard_check_pressed(ord("E"))) {
        // Крок 4: Шукаємо перший порожній слот в інвентарі
        var added_to_inventory = false;
        for (var i = 0; i < 8; i++) {
            if (global.inventory[i] == 0) {  // Якщо слот порожній
                global.inventory[i] = item_id;  // Додаємо предмет в цей слот
                added_to_inventory = true;
                break;  // Виходимо з циклу після додавання
            }
        }

        // Якщо предмет було додано в інвентар
        if (added_to_inventory) {
            global.items_picked[item_uid] = true; // Позначаємо предмет як підібраний
            instance_destroy();  // Знищуємо предмет після підбору
        }
    }
}
