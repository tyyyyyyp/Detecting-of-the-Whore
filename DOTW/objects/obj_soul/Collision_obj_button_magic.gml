// Перевірка, чи натиснута кнопка E
if (keyboard_check_pressed(ord("E")))
 if (distance_to_object(obj_trigger) < 50) {
    // Якщо ману вистачає
    if (mana >= 0) {
        mana -= 0;  // Витрачаємо 20 мани
	}
}
