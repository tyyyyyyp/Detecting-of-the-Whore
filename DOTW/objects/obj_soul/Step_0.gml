var _key_left = keyboard_check(ord("A"))
var _key_right = keyboard_check(ord("D"))
var _key_up = keyboard_check(ord("W"))
var _key_down = keyboard_check(ord("S"))

var _min_x = 100
var _max_x = 1000
var _min_y = 200
var _max_y = 800




var _hdir = _key_right - _key_left
var _vdir = _key_down - _key_up


if _hdir !=0 or _vdir !=0{
	var _ang = point_direction(0,0,_hdir,_vdir)
	var _x = lengthdir_x(move_speed,_ang)
	var _y = lengthdir_y(move_speed,_ang)
	x += _x
	y += _y
}
x = clamp(x,_min_x,_max_x)
y = clamp(y,_min_y,_max_y)


// Відновлення здоров'я та мани

mana = min(mana + mana_regen_rate, max_mana);  // Мана не перевищує максимум

// Зменшення здоров'я при отриманні пошкоджень
if (health > 0) {
  
}




// Обчислюємо відстань до кнопки obj_button_magic
var distance_to_button = point_distance(x, y, obj_button_magic.x, obj_button_magic.y);

// Якщо гравець поруч з кнопкою
if (distance_to_button <= 50) {
    // Малюємо індикацію, наприклад, змінюємо колір
    draw_set_color(c_yellow);
    draw_circle(obj_button_magic.x, obj_button_magic.y, 10, false);  // Малюємо коло
}
// Якщо є пошкодження

    // Перевірка, чи здоров'я не менше за 0
 {   health = max(health, 100);  // Забезпечуємо, щоб здоров'я не було меншим за 0
}
// Збільшуємо кулдаун на отримання урону
hurt_cooldown += 1;

// Перевірка, чи можна отримати урон (кулдаун закінчився)
if (hurt_cooldown >= hurt_time) {
    hurt_cooldown = hurt_time;  // Кулдаун не може бути меншим за hurt_time
}
