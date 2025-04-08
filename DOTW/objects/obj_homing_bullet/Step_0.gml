// Виконується кожен кадр
if (homing_time > 0) {
    // Зменшуємо час слідкування
    homing_time -= 1;
    
    // Визначаємо напрямок до гравця
    var direction_to_player = point_direction(x, y, obj_soul.x, obj_soul.y);
    
    // Рухаємо пульку в бік гравця
    direction = direction_to_player;
    speed = 5;
} else {
    // Після 5 секунд пулька просто летить прямо
    speed = 5;
}
// Якщо пулька виходить за межі екрану, знищуємо її
if (y < 0) {
    instance_destroy();  // Знищуємо пульку, якщо вона виходить за межі екрану
}
// Перевіряємо колізію з obj_soul
if (place_meeting(x, y, obj_soul)) {
    // Віднімаємо здоров'я у obj_soul
  if (instance_exists(obj_soul)) {
        obj_soul.health = damage;  // Віднімаємо шкоду від здоров'я гравця
    }
    // Знищуємо пульку
    instance_destroy();
}
