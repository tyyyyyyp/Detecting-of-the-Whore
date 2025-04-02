// Збільшуємо кулдаун
shoot_cooldown += 1;

// Якщо кулдаун закінчився, створюємо пульку
if (shoot_cooldown >= shoot_time) {
    // Створюємо пульку внизу екрану, в центрі
    instance_create_layer(room_width / 2, room_height, "Instances", obj_bullet);
    
    // Скидаємо кулдаун
    shoot_cooldown = 0;
}
