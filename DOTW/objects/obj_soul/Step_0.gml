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


// Перевірка для атаки ворога
if (distance_to_object(obj_button_magic) < 50 && keyboard_check_pressed(ord("E"))) {
    // Знайти ворога
    var target = instance_find(obj_enemy, 0);  // Знайти перший об'єкт obj_enemy на сцені
    if (target != noone) {
        // Якщо мана достатня для атаки (20 мани для кожної атаки)
        if (mana >= 20) {
            target.hp -= 10;  // Віднімаємо 10 HP ворогу
            mana -= 20;  // Витрачаємо 20 мани
 

            // Якщо ворог вбитий, створюємо тригер
            if (target.hp <= 0) {
                instance_create_layer(400, 300, "Instances", obj_trigger_exit);  // Створюємо тригер в конкретному місці
  
            }
        } else {
;
        }
    }
}
