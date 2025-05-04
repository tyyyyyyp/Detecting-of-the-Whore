if (!global.inventory_open) exit;

// Фон інвентаря
draw_set_color(c_black);
draw_rectangle(50, 50, 300, 330, false);
draw_set_color(c_white);
draw_text(110, 60, "INVENTORY:");

// Виведення слотів
for (var i = 0; i < 8; i++) {
    var slot_y = 90 + i * 28;
    var item_id = global.inventory[i];

    // Якщо слот порожній, пропускаємо відображення
    if (item_id == 0) continue;

    // Якщо предмет є в списку
    if (item_id > 0 && item_id <= array_length(global.item_list)) {
        var itemData = global.item_list[item_id - 1];
        var item_name = itemData.name;

        // Обраний слот
        if (i == selected_slot) {
            draw_set_color(c_yellow);
            draw_text(35, slot_y, ">>");
        }

        // Виведення назви предмета
        draw_set_color(c_white);
        draw_text(150, slot_y, item_name);
    }
}

// Опис предмета
var selected_item_id = global.inventory[selected_slot];

if (selected_item_id > 0 && selected_item_id <= array_length(global.item_list)) {
    var itemData = global.item_list[selected_item_id - 1];
    var item_name = itemData.name;

    draw_text(60, 330, "Item: " + item_name);
}
