// Перевіряємо колізію з obj_soul
if (place_meeting(x, y, obj_soul)) {
    // Віднімаємо здоров'я у obj_soul
  if (instance_exists(obj_soul)) {
        obj_soul.health = damage;  // Віднімаємо шкоду від здоров'я гравця
    }
    // Знищуємо пульку
    instance_destroy();
}
