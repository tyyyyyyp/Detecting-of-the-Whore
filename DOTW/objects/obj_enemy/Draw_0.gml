draw_self()


// Малюємо текст здоров'я
var display_x = display_get_width() - 200; // Позиція по горизонталі (правий верхній кут)
var display_y = 75; // Позиція по вертикалі (відстань від верху)

draw_text(display_x, display_y, "HP: " + string(hp)); // Виводимо здоров'я

// Визначаємо розмір і місце для бару здоров'я
var bar_width = 200; // Ширина бару
var bar_height = 35; // Висота бару
var bar_x = display_get_width() - bar_width - 70; // Розміщення по горизонталі
var bar_y = 20; // Розміщення по вертикалі

// Малюємо фон бару здоров'я (сірий)
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Визначаємо колір бару здоров'я залежно від поточного здоров'я ворога
var health_ratio = hp / 100; // Співвідношення здоров'я

// Якщо здоров'я менше 35% від максимального, змінюємо колір на фіолетовий
if (hp <= 35) {
    draw_set_color(c_navy); // Фіолетовий колір для бару
} else {
    draw_set_color(c_maroon); // Зелений або інший колір для нормального здоров'я
}

// Малюємо бар здоров'я
var health_width = bar_width * health_ratio;
draw_rectangle(bar_x, bar_y, bar_x + health_width, bar_y + bar_height, false);
