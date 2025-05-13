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




// 🔐 Якщо магія ще заблокована — чекаємо
if (magic_locked) {
    magic_lock_timer -= 1;
    if (magic_lock_timer <= 0) {
        magic_locked = false;
        show_debug_message("Магія розблокована");
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
  audio_play_sound(snd_press,0,false)
    if (mana >= 20) {
        // Перевірка чи є що лікувати
        if (health < 100) {
            // Виконуємо хілку
            mana -= 20;
            health = min(health + 30, 100);
           

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



// 🔐 Якщо магія ще заблокована — чекаємо
if (magic_locked) {
    magic_lock_timer -= 1;
    if (magic_lock_timer <= 0) {
        magic_locked = false;
        show_debug_message("Магія розблокована");
    }
}

// 🛠 Функція перевірки активного предмета
function is_item_used_by_name(item_name) {
    for (var i = 0; i < array_length(global.used_items); i++) {
        if (global.used_items[i] == item_name) {
            return true;
        }
    }
    return false;
}

// ⚔️ Перевірка атаки
if (!attack_pending && !magic_locked && distance_to_object(obj_button_magic) < 50 && keyboard_check_pressed(ord("E"))) {
    
    // Знаходимо найближчого ворога серед obj_enemy та obj_enemy_2
    var nearest_enemy = noone;
    var nearest_distance = 999999;

    for (var i = 0; i < instance_number(obj_enemy); i++) {
        var e = instance_find(obj_enemy, i);
        var d = point_distance(x, y, e.x, e.y);
        if (d < nearest_distance) {
            nearest_distance = d;
            nearest_enemy = e;
        }
    }

    for (var i = 0; i < instance_number(obj_enemy_2); i++) {
        var e2 = instance_find(obj_enemy_2, i);
        var d2 = point_distance(x, y, e2.x, e2.y);
        if (d2 < nearest_distance) {
            nearest_distance = d2;
            nearest_enemy = e2;
        }
    }

    if (nearest_enemy != noone && mana >= 20) {
        // Запускаємо ефект
        instance_create_layer(1165, 410, "Effects", obj_attack_effect);

        audio_play_sound(Sound4, 0, false);
        attack_pending = true;
        attack_timer = room_speed; // 1 секунда
        attack_target = nearest_enemy;

        // 🔐 Блокуємо кнопку на 10 секунд
        magic_locked = true;
        magic_lock_timer = room_speed * 10;
        show_debug_message("Магія заблокована на 10 секунд");
    }
}

// ⏳ Завершення ефекту атаки
if (attack_pending) {
    attack_timer -= 1;

    if (attack_timer <= 0) {
        if (instance_exists(attack_target)) {
            var damage;
            if (is_item_used_by_name("Question Staff")) {
                damage = irandom_range(1, 100);
            } else {
                damage = irandom_range(1, 20);
            }

            attack_target.hp -= damage;
            mana -= 20;

            // Зберігаємо позицію і значення урону для показу в draw
            damage_popup_value = damage;
            damage_popup_timer = room_speed; // 1 секунда
            damage_popup_x = attack_target.x;
            damage_popup_y = attack_target.y - 32;

            show_debug_message("Завдано шкоди: " + string(damage));

            // Якщо ворог мертвий — тригер
            if (attack_target.hp <= 0) {
                instance_create_layer(800, 400, "Instances", obj_trigger_exit);

                // 🔥 Підрахунок вбивств магією
                global.magic_kills += 1;
                show_debug_message("Магічних вбивств: " + string(global.magic_kills));
            }
        }
        attack_pending = false;
    }
}





// Перевірка для пощадження ворога
if (distance_to_object(obj_button_free) < 50 && keyboard_check_pressed(ord("E"))) {

    var nearest_enemy = noone;
    var nearest_distance = 999999;

    // Перевірка obj_enemy
    for (var i = 0; i < instance_number(obj_enemy); i++) {
        var e = instance_find(obj_enemy, i);
        var d = point_distance(x, y, e.x, e.y);
        if (d < nearest_distance) {
            nearest_distance = d;
            nearest_enemy = e;
        }
    }

    // Перевірка obj_enemy_2
    for (var i = 0; i < instance_number(obj_enemy_2); i++) {
        var e2 = instance_find(obj_enemy_2, i);
        var d2 = point_distance(x, y, e2.x, e2.y);
        if (d2 < nearest_distance) {
            nearest_distance = d2;
            nearest_enemy = e2;
        }
    }

    // Якщо знайдено ворога поруч
    if (nearest_enemy != noone) {
        if (nearest_enemy.hp < 35) {
            audio_play_sound(snd_press, 0, false);
            nearest_enemy.hp = 0;

            // 🔢 Додаємо до пощаджених
            global.spared_enemies += 1;
            show_debug_message("Пощаджено ворогів: " + string(global.spared_enemies));

            instance_create_layer(400, 300, "Instances", obj_trigger_exit);
        } else {
            show_debug_message("Ворог занадто сильний для пощади.");
        }
    }
}
