 move_speed = 3;


my_tilemap = layer_tilemap_get_id("Tiles_8");	

global.inventory_open = false;
// Ініціалізація інвентаря в Create Event
global.inventory = array_create(8, 0);  // 8 слотів для інвентаря, кожен спочатку порожній
global.player_x = x;
global.player_y = y;
x = global.player_x;
y = global.player_y;

if (variable_global_exists("saved_random_number")) {
    random_number = global.saved_random_number;
} else {
    random_number = irandom_range(1, 100);
}
