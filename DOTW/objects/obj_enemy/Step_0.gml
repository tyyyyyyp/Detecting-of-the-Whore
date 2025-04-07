// Збільшуємо кулдаун
shoot_cooldown += 1;

// Якщо кулдаун закінчився, створюємо кілька пульок
if (shoot_cooldown >= shoot_time) {
    // Створюємо кілька пульок знизу екрану
    var bullet_count = 15; // Кількість пульок, які будемо створювати одночасно
    for (var i = 0; i < bullet_count; i++) {
        // Випадкова горизонтальна координата для кожної пульки
        var bullet_x = random(room_width);
        
        // Початкова вертикальна координата знизу екрану
        var bullet_y = room_height;
        
        // Створюємо пульку
        var bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
        
        // Встановлюємо вертикальну швидкість пульки (рух вгору)
        bullet.speed = 5;
    }
    
    // Скидаємо кулдаун
    shoot_cooldown = 0;
}

// Перевіряємо здоров'я ворога
if (hp <= 0) {
    instance_destroy(); // Знищуємо ворога
}
