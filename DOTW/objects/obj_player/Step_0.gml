

// Отримуємо введення з клавіатури
input_left = keyboard_check(ord("A"));
input_right = keyboard_check(ord("D"));
input_up = keyboard_check(ord("W"));
input_down = keyboard_check(ord("S"));

// Обчислюємо напрямок руху
var move_x = input_right - input_left;
var move_y = input_down - input_up;

// Визначаємо спрайт залежно від напряму руху
if (move_x > 0) {
    sprite_index = mango_right;
} 
else if (move_x < 0) {
    sprite_index = mango_left;
} 
else {
    if (sprite_index == mango_left) sprite_index = manstnd9;
    if (sprite_index == mango_right) sprite_index = manstnd8;
}

if (move_y > 0) {
    sprite_index = mango_down;
} 
else if (move_y < 0) {
    sprite_index = mango_up;
} 
else {
    if (sprite_index == mango_down) sprite_index = manstand_sad;
    if (sprite_index == mango_up) sprite_index = manstand_happy;
}

// КОЛІЗІЯ
var new_x = x + move_speed * move_x;
var new_y = y + move_speed * move_y;

// Рух по осі X (горизонтально)
if (!place_meeting(new_x, y, obj_wall)) {
    x = new_x;
} else {
    while (!place_meeting(x + sign(move_x), y, obj_wall)) {
        x += sign(move_x); // Додаємо 1 піксель за раз для точності
    }
    // Якщо зіткнення з лівою стіною
    if (sign(move_x) == -1) {
        sprite_index = man_kiss_wall_left;
    }
    // Якщо зіткнення з правою стіною
    if (sign(move_x) == 1) {
        sprite_index = man_kiss_wall_right;
    }
}

// Рух по осі Y (вертикально)
if (!place_meeting(x, new_y, obj_wall)) {
    y = new_y;
} else {
    while (!place_meeting(x, y + sign(move_y), obj_wall)) {
        y += sign(move_y); // Додаємо 1 піксель за раз для точності
    }
    // Якщо зіткнення з верхньою стіною
    if (sign(move_y) == -1) {
        sprite_index = man_kiss_wall_up;
    }
    // Якщо зіткнення з нижньою стіною
    if (sign(move_y) == 1) {
        sprite_index = man_kiss_wall_down;
    }
}

