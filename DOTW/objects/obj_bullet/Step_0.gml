// В об'єкті obj_bullet на кожному кроці (в події Step)
y -= speed; // Рухаємо пульку рівно вгору по вертикалі
x -= speed

// Якщо пулька виходить за межі екрану, знищуємо її
if (y < 0) {
    instance_destroy();  // Знищуємо пульку, якщо вона виходить за межі екрану
}

// Перевірка на зіткнення з гравцем
if (collision_point(x, y, obj_soul, true, true)) {
    
	if (place_meeting(x, y, obj_soul)) {
	instance_destroy()
// Перевірка, чи існує об'єкт obj_soul і чи має він змінну health
    if (instance_exists(obj_soul)) {
        obj_soul.health = damage;  // Віднімаємо шкоду від здоров'я гравця
}
	
    }

  
}
