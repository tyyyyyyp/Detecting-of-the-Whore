if (!global.inventory_open) exit;

// Перемикання між слотами
if (keyboard_check_pressed(ord("W"))) {
    selected_slot = max(0, selected_slot - 1);
}

if (keyboard_check_pressed(ord("S"))) {
    selected_slot = min(7, selected_slot + 1);
}

// Використання предмета
if (keyboard_check_pressed(ord("E"))) {
    var item_id = inventory[selected_slot];
    
    if (item_id != 0) {
        var item = item_list[item_id - 1]; // -1 бо ID з 1
        show_debug_message("Used: " + item.name);

        // TODO: Застосуй ефект — наприклад, heal, екіпіровка і т.п.
        // Потім видали предмет
        inventory[selected_slot] = 0;
    }
}
