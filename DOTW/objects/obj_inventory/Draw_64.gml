if (!global.inventory_open) exit;



draw_set_color(c_white);
draw_text(110, 60, "INVENTORY:");
draw_text(110, 340, "IS USED:");

draw_set_color(c_ltgray);
draw_text(250, 60, mode == "inventory" ? "<" : "");
draw_text(250, 340, mode == "used" ? "<" : "");

// --- Вивід інвентаря ---
for (var i = 0; i < 8; i++) {
    var slot_y = 90 + i * 28;
    var item_id = global.inventory[i];

    if (i == selected_slot && mode == "inventory") {
        draw_set_color(c_yellow);
        draw_text(35, slot_y, ">>");
    }

    if (item_id > 0 && item_id <= array_length(global.item_list)) {
        var itemData = global.item_list[item_id - 1];
        draw_set_color(c_white);
        draw_text(150, slot_y, itemData.name);
    }
}

// --- Вивід використаних ---
for (var j = 0; j < array_length(global.used_items); j++) {
    var used_y = 370 + j * 20;

    if (j == used_selected_slot && mode == "used") {
        draw_set_color(c_orange);
        draw_text(35, used_y, ">>");
    }

    draw_set_color(c_white);
    draw_text(130, used_y, global.used_items[j]);
}
// --- Вивід кількості магічних вбивств ---
draw_set_color(c_aqua);
draw_text(400, 60, "kills: " + string(global.magic_kills));

draw_set_color(c_lime);
draw_text(400, 90, "dismissed: " + string(global.spared_enemies));