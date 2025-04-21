// Лічильник атак
var attack_count = 0;

// Збільшуємо кулдаун
shoot_cooldown += 1;

// Якщо кулдаун закінчився
if (shoot_cooldown >= shoot_time) {
    // Якщо атак було менше 7 разів, створюємо звичайні пульки
    if (attack_count < 7) {
        // Створюємо кілька пульок знизу екрану
        var bullet_count = 5; // Кількість пульок, які будемо створювати одночасно
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
        
        // Збільшуємо лічильник атак
        attack_count += 1;
    }

    // Створюємо пульки, що слідкують за гравцем під час кожної атаки
    var homing_bullet_count = 1; // Кількість пульок, які будуть слідкувати за гравцем (менше пульок)

    for (var i = 0; i < homing_bullet_count; i++) {
        // Випадкова горизонтальна координата для кожної пульки
        var bullet_x = 1200;
        
        // Випадкова вертикальна координата в межах кімнати
        var bullet_y = 500;
        
        // Створюємо пульку, що слідкує за гравцем
        var homing_bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_homing_bullet);
        
        // Встановлюємо властивість слідкування (5 секунд)
        homing_bullet.homing_time = 2 * room_speed; // 5 секунд слідкування за гравцем
        homing_bullet.target = obj_soul; // Ціль - гравець
    }

    // Скидаємо кулдаун
    shoot_cooldown = 0;
}

// Перевіряємо здоров'я ворога
if (hp <= 0) {
    instance_destroy(); // Знищуємо ворога
}
