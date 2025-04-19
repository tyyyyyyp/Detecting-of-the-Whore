// Movement
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));

var _min_x = 100;
var _max_x = 1000;
var _min_y = 200;
var _max_y = 800;

var _hdir = _key_right - _key_left;
var _vdir = _key_down - _key_up;

if (_hdir != 0 or _vdir != 0) {
    var _ang = point_direction(0, 0, _hdir, _vdir);
    var _x = lengthdir_x(move_speed, _ang);
    var _y = lengthdir_y(move_speed, _ang);
    x += _x;
    y += _y;
}
x = clamp(x, _min_x, _max_x);
y = clamp(y, _min_y, _max_y);

// Health Regeneration (Limit Health Regeneration)
if (health < max_health) {
    health += health_regen_rate;  // Regenerate health
    health = min(health, max_health);  // Ensure health doesn't exceed max_health
}

// Mana Regeneration
mana = min(mana + mana_regen_rate, max_mana);  // Ensure mana doesn't exceed max_mana

// Damage Handling
if (health > 0) {
    // Health and damage logic
    // This part handles the damage logic (like from bullets or other sources)
}

// Оновлюємо кулдаун на кожен крок
hurt_cooldown += 1;

// Якщо кулдаун закінчився, перевіряємо отримання урону
if (hurt_cooldown >= hurt_time) {
    hurt_cooldown = 0;  // Скидаємо кулдаун після закінчення часу
}

// Додаємо логіку для отримання урону при зіткненні з кулею
if (place_meeting(x, y, obj_bullet)) {
    // Перевіряємо, чи пройшов кулдаун
    if (hurt_cooldown == 0) {
        // Застосовуємо урон
        health -= 10;  // Наприклад, віднімаємо 10 від здоров'я
        
        // Відновлюємо кулдаун
        hurt_cooldown = 1; // Встановлюємо кулдаун після отримання урону
    }
}


// Interaction with Magic Button
var distance_to_button = point_distance(x, y, obj_button_magic.x, obj_button_magic.y);
if (distance_to_button <= 50) {
    draw_set_color(c_yellow);
    draw_circle(obj_button_magic.x, obj_button_magic.y, 10, false);
}

// Ensure health never goes below 0
health = max(health, 0);

// Dash variables
var dash_cooldown = 0;         // Dash cooldown timer
var dash_time = 5 * room_speed; // Cooldown in frames (5 seconds)
var dash_mana_cost = 10;       // Mana cost for dash
var dash_speed = 10;           // Speed multiplier for dash (adjust as needed)

// Bar Variables (for the cooldown display)
var cooldown_bar_width = 100;  // Width of the cooldown bar
var bar_height = 10;           // Height of the cooldown bar

// Перевірка для пощадження ворога
if (distance_to_object(obj_button_free) < 50 && keyboard_check_pressed(ord("E"))) {
    // Знайти ворога
    var target = instance_find(obj_enemy, 0);  // Знайти перший об'єкт obj_enemy на сцені
    if (target != noone) {
        // Перевірка, чи в монстра HP менше 35
        if (target.hp < 35) {
            // Пощадити монстра
            target.hp = 0;  // Встановлюємо, що монстр пощаджений (можна змінити, якщо потрібно інше значення)

            // Створюємо тригер після пощадження монстра
            instance_create_layer(400, 300, "Instances", obj_trigger_exit);  // Створюємо тригер в конкретному місці
        } else {
            // Можна додати інший код, якщо монстр має більше 35 HP (наприклад, показати повідомлення)
          
        }
    }
}


// 🔐 Якщо магія ще заблокована — чекаємо
if (magic_locked) {
    magic_lock_timer -= 1;
    if (magic_lock_timer <= 0) {
        magic_locked = false;
        show_debug_message("Магія розблокована");
    }
}

// ⚔️ Перевірка атаки
if (!attack_pending && !magic_locked && distance_to_object(obj_button_magic) < 50 && keyboard_check_pressed(ord("E"))) {
    var target = instance_find(obj_enemy, 0);
    if (target != noone && mana >= 20) {
        // Запускаємо ефект
        instance_create_layer(1165, 410, "Effects", obj_attack_effect);

        // Встановлюємо таймер анімації та ціль
        attack_pending = true;
        attack_timer = room_speed; // 1 секунда
        attack_target = target;

        // 🔐 Блокуємо кнопку на 10 секунд
        magic_locked = true;
        magic_lock_timer = room_speed * 10;
        show_debug_message("Магія заблокована на 10 секунд");
    }
}

// ⏳ Чекаємо завершення ефекту
if (attack_pending) {
    attack_timer -= 1;

    if (attack_timer <= 0) {
        if (instance_exists(attack_target)) {
            attack_target.hp -= 10;
            mana -= 20;

            // Якщо ворог мертвий — тригер
            if (attack_target.hp <= 0) {
                instance_create_layer(800, 400, "Instances", obj_trigger_exit);
            }
        }
        attack_pending = false;
    }
}
// Кулдаун хілки
if (heal_locked) {
    heal_lock_timer -= 1;
    if (heal_lock_timer <= 0) {
        heal_locked = false;
        show_debug_message("Хілка готова!");
    }
}

// Хілка, тільки якщо кулдаун неактивний
if (!heal_locked &&  distance_to_object(obj_button_heal) < 50 && keyboard_check_pressed(ord("E"))) {
    // Перевірка мани
    if (mana >= 20) {
        // Перевірка чи є що лікувати
        if (health < 100) {
            // Виконуємо хілку
            mana -= 20;
            health = min(health + 30, 100);
            audio_play_sound(snd_heal, 0, false);

            // Запускаємо кулдаун тільки якщо справді хілка пройшла
            heal_locked = true;
            heal_lock_timer = room_speed * 10;

        } else {
            show_debug_message("Здоров'я вже повне — не хілимось.");
        }
    } else {
        show_debug_message("Нема мани для хілки.");
    }
}
