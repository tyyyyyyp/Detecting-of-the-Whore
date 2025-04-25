swing_angle += swing_speed;
x += sin(swing_angle) * 0.5;
y += fall_speed;

image_angle += angle_speed;

if (y > room_height + 50) {
    instance_destroy();
}
// Отримуємо поточну кількість частинок
var faller_count = instance_number(obj_season_faller);

// Якщо їх менше 30 — дозволяємо створити новий
if (faller_count < 30) {
    if (irandom(20) == 0) { // рідше спавниться (зміни число за бажанням)
        instance_create_layer(random(room_width), -32, "Instances", obj_season_faller);
    }
}
