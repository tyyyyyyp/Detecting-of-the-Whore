// Створюємо кастомну камеру розміром 640x360
var cam = camera_create_view(0, 0, 960, 660, 0, noone, -1, -1, -1, -1);

// Зберігаємо ID у змінну
global.my_camera = cam;

// Прив’язуємо до viewport 0
view_set_camera(0, global.my_camera);
view_set_visible(0, true);
if (!variable_global_exists("trigger_used")) {
    global.trigger_used = false;
}
