// Рух пульки вгору
y -= speed;  // Рух пульки вгору (по вертикалі)

// Якщо пулька виходить за межі екрану, знищуємо її
if (y < 0) {
    instance_destroy();  // Знищуємо пульку, якщо вона виходить за межі екрану
}

// Перевірка на зіткнення з гравцем
if (collision_point(x, y, obj_soul, true, true)) {
    // Перевірка, чи існує об'єкт obj_soul і чи має він змінну health
    if (instance_exists(obj_soul)) {
        obj_soul.health = damage;  // Віднімаємо шкоду від здоров'я гравця
    }

    // Знищуємо тільки пульку після зіткнення
    instance_destroy();  // Знищуємо пульку
}
