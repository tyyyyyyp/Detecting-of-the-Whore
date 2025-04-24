// Збільшуємо кулдаун
shoot_cooldown += 2;

// Якщо пройшло 2 секунди
if (shoot_cooldown >= room_speed * 2) {
    
    var warning_bullet_count = irandom_range(1, 10); // 1–3 попередження

    for (var i = 0; i < warning_bullet_count; i++) {
		audio_play_sound(Sound4 , 0 , false)
        // X в межах: 0–1000
        var bullet_x = irandom_range(0, 1000);

        // Y в межах: 60–room_height
        var bullet_y = irandom_range(200, 800);

        // Створити попередження
        instance_create_layer(bullet_x, bullet_y, "Instances", obj_warning);
    }

    shoot_cooldown = 0;
}
// Перевіряємо здоров'я ворога
if (hp <= 0) {
    instance_destroy(); // Знищуємо ворога
}
