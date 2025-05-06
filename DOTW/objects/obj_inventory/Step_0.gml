if (!global.inventory_open) exit;

// Перемикання режимів TAB
if (keyboard_check_pressed(vk_tab)) {
    if (mode == "inventory") {
        mode = "used";
    } else {
        mode = "inventory";
    }
}

// --- ІНВЕНТАРНИЙ РЕЖИМ ---
if (mode == "inventory") {
    if (keyboard_check_pressed(ord("W"))) {
        selected_slot = max(0, selected_slot - 1);
    }

    if (keyboard_check_pressed(ord("S"))) {
        selected_slot = min(7, selected_slot + 1);
    }

    // Використати предмет
    if (keyboard_check_pressed(ord("E"))) {
        var item_id = global.inventory[selected_slot];

        if (item_id != 0) {
            var item = global.item_list[item_id - 1];
            show_debug_message("Used: " + item.name);

            // Додати до використаних
            array_push(global.used_items, item.name);

            // Очистити з інвентаря
            global.inventory[selected_slot] = 0;
        }
    }
}

// --- РЕЖИМ ВИКОРИСТАНИХ ---
if (mode == "used") {
    if (keyboard_check_pressed(ord("W"))) {
        used_selected_slot = max(0, used_selected_slot - 1);
    }

    if (keyboard_check_pressed(ord("S"))) {
        used_selected_slot = min(array_length(global.used_items) - 1, used_selected_slot + 1);
    }

    // Повернути предмет назад в інвентар
    if (keyboard_check_pressed(ord("E"))) {
        if (array_length(global.used_items) > 0) {
            var item_name = global.used_items[used_selected_slot];

            // Знайти предмет по імені
            for (var i = 0; i < array_length(global.item_list); i++) {
                if (global.item_list[i].name == item_name) {
                    var item_id = global.item_list[i].id;

                    // Знайти вільне місце в інвентарі
                    for (var j = 0; j < 8; j++) {
                        if (global.inventory[j] == 0) {
                            global.inventory[j] = item_id;
                            break;
                        }
                    }

                    // Видалити з використаних
                    array_delete(global.used_items, used_selected_slot, 1);

                    // Зменшити selected, якщо потрібно
                    used_selected_slot = clamp(used_selected_slot, 0, array_length(global.used_items) - 1);
                    break;
                }
            }
        }
    }
}
