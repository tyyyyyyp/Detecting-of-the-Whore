 move_speed = 3;


my_tilemap = layer_tilemap_get_id("Tiles_8");	

inventory = []; // Створюємо порожній масив інвентаря
inventory_open = false; // Початково інвентар закритий
inventory_index = 0;
equipped_item = "none"; // або "" якщо хочеш порожнє значення

// Ініціалізуємо інвентар


if (variable_global_exists("loadedInventory")) {
    inventory = global.loadedInventory; // передаємо збережений інвентар
}
