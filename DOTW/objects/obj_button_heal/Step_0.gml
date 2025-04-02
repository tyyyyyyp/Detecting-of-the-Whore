// Якщо об'єкт obj_soul не торкається кнопки, змінюємо спрайт назад
if (!place_meeting(x, y, obj_soul)) {
    sprite_index = spr_button_heal; // Повертаємо початковий спрайт
}
