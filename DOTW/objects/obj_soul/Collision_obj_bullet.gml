// Якщо кулдаун закінчився, то наносимо урон
if (hurt_cooldown >= hurt_time) {
    health -= obj_bullet.damage;  // Віднімаємо шкоду від здоров'я гравця
    hurt_cooldown = 0; // Скидаємо кулдаун
}
