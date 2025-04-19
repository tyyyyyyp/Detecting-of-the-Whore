// Якщо об'єкт obj_soul не торкається кнопки, змінюємо спрайт назад
if (!place_meeting(x, y, obj_soul)) {
    sprite_index = spr_button_magic; // Повертаємо початковий спрайт
}
// Перевіряємо, чи існує obj_soul
if (instance_exists(obj_soul)) {
    if (obj_soul.magic_locked) {
        sprite_index = spr_magggic; // Змінюємо спрайт на "заблокований"
    } else {
        sprite_index = spr_button_magic; // Повертаємо нормальний спрайт
    }
}
