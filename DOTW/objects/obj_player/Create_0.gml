 move_speed = 3;


my_tilemap = layer_tilemap_get_id("Tiles_8");	


// obj_player -> Create Event
global.is_text_active = false;  // Текст не активний за замовчуванням
global.is_typing = false;  // Текст не набирається за замовчуванням
global.text = "";  // Немає тексту за замовчуванням
global.text_index = 1;  // Початковий індекс
