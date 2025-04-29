 move_speed = 3;


my_tilemap = layer_tilemap_get_id("Tiles_8");	

global.inventory = []; // Створюємо порожній масив інвентаря
global.inventory_open = false; // Початково інвентар закритий
global.inventory_index = 0;
global.equipped_item = "none"; // або "" якщо хочеш порожнє значення

