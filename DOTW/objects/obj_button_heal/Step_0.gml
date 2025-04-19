// Якщо об'єкт obj_soul не торкається кнопки, змінюємо спрайт назад
if (!place_meeting(x, y, obj_soul)) {
    sprite_index = spr_button_heal; // Повертаємо початковий спрайт
}
if (instance_exists(obj_soul)) {
    if (obj_soul.heal_locked) {
        sprite_index = spr_heaaal; // показуємо "на кулдауні"
    } else {
        sprite_index = spr_button_heal; // показуємо активну хілку
    }
}
