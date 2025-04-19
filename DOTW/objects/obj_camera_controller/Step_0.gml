// Перевіряємо чи існує гравець
var player = obj_player_2;
if (!instance_exists(player)) exit;

// Отримуємо камеру, яку ми створили раніше
var cam = global.my_camera;

// Розміри камери
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Поточна позиція камери
var cam_x = camera_get_view_x(cam);

// Позиція гравця
var px = player.x;

// Буфер (відстань від краю екрану, в якому гравець може рухатися)
var margin_x = 64;

// Нове значення для камери
var new_x = cam_x;

// Камера рухається тільки якщо гравець виходить за межі цього буфера
if (px < cam_x + margin_x) {
    new_x = px - margin_x;
} 
else if (px > cam_x + cam_w - margin_x) {
    new_x = px - cam_w + margin_x;
}

// Обмежуємо рух камери в межах кімнати
new_x = clamp(new_x, 0, room_width - cam_w);

// Плавне переміщення (якщо хочеш, щоб камера рухалась плавно, заміни на `lerp`)
var smooth_x = lerp(cam_x, new_x, 0.2);

// Встановлюємо нову позицію камери
camera_set_view_pos(cam, smooth_x, 0);  // Тільки по осі X (горизонтально)
