// Визначаємо сезон
var current_datetime = date_current_datetime();
var month = date_get_month(current_datetime);

// Призначаємо відповідний спрайт
if (month == 12 || month == 1 || month == 2) {
    sprite_index = spr_1; // зима
} else if (month >= 3 && month <= 5) {
    sprite_index = spr_2; // весна
} else if (month >= 6 && month <= 8) {
    sprite_index = spr_3; // літо
} else if (month >= 9 && month <= 11) {
    sprite_index = spr_4; // осінь
}

// Початкова позиція — x вже передається, y ставимо вище екрану
y = -random(100);

// Падіння
fall_speed = random_range(1, 2);

// Гойдання
swing_amplitude = random_range(10, 30);
swing_speed = random_range(0.05, 0.1);
swing_angle = random(360);

// Обертання
image_angle = random(360);
angle_speed = random_range(-1, 1);
