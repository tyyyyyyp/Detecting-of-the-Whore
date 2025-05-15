// Ініціалізація змінних
alpha = 0;  // Початкова прозорість — повністю прозорий
speed = 0.05;  // Швидкість змінювання прозорості
transition_in = true;  // Починаємо плавно затемняти екран
transition_out = false;  // Плавне освітлення екрану після переходу
global.previous_room = room;  // Зберігаємо поточну кімнату для повернення назад
//create event
target_rm = 0
target_x = 0
target_y = 0
// Перевірка: якщо змінна ще не існує — створюємо її
if (!variable_global_exists("trigger_used")) {
    global.trigger_used = false;
}

// Якщо прапорець встановлений — знищити себе
if (global.trigger_used) {
    instance_destroy();
}
