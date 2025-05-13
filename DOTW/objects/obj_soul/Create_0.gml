// Ініціалізація здоров'я та мани
health = 100;  // Початкове здоров'я
max_health = 100; // Максимальне здоров'я
mana = 100;  // Початкова мана
max_mana = 100;  // Максимальна мана

// Швидкість відновлення

mana_regen_rate = 0.05;   // Швидкість відновлення мани


// Ініціалізація змінних


hurt_cooldown = 0; // Кулдаун на отримання урону
hurt_time = 30; // Час між отриманнями урону в кадрах (приблизно 1 секунд)

health_regen_rate = 0.01;
interaction_timer = 15;

move_speed = 6;

dash_cooldown = 10;

dash_time = 1;
dash_speed = 10;
cooldown_bar_width = 30;
bar_height = 200;

show_heal_message = false;  // Спочатку текст не показується

attack_pending = false;
attack_timer = 0;
attack_target = noone;

magic_locked = false;
magic_lock_timer = 0;
heal_locked = false;
heal_lock_timer = 0;
damage_popup_value = 0;
damage_popup_timer = 0;
damage_popup_x = 0;
damage_popup_y = 0;
