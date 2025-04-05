// Зміна спрайту на spr_button_magic_2
sprite_index = spr_button_magic_2;
// Якщо натискається клавіша "E"
if (keyboard_check_pressed(ord("E"))) {
    // Перевірка, чи є достатньо мани для атаки
    if (obj_soul.mana >= 0) { // Перевіряємо, чи є хоча б 20 мани
        // Шукаємо ворога на сцені
        var target = instance_find(obj_enemy, 0);  // Шукаємо перший об'єкт ворога на сцені
        
        if (target != noone) {
            // Якщо ворог знайдений, віднімаємо 10 HP ворогу
            target.hp -= 0;
            
            // Віднімаємо 20 мани
            obj_soul.mana -= 0;
        }
    } else {
      
    }
}
