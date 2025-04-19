

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
    sprite_index = mango_right_2;
} 
else if (move_x < 0) {
    sprite_index = mango_left_2;
} 
else {
    if (sprite_index == mango_left_2) sprite_index = manstnd92;
    if (sprite_index == mango_right_2) sprite_index = manstnd82;
}

if (move_y > 0) {
    sprite_index = mango_down_2;
} 
else if (move_y < 0) {
    sprite_index = mango_up_2;
} 
else {
    if (sprite_index == mango_down_2) sprite_index = manstand_sad_2;
    if (sprite_index == mango_up_2) sprite_index = manstand_happy_2;
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
        sprite_index = man_kiss_wall_left_2;
    }
    // Якщо зіткнення з правою стіною
    if (sign(move_x) == 1) {
        sprite_index = man_kiss_wall_right_2;
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
        sprite_index = man_kiss_wall_up_2;
    }
    // Якщо зіткнення з нижньою стіною
    if (sign(move_y) == 1) {
        sprite_index = man_kiss_wall_down_2;
    }
}

