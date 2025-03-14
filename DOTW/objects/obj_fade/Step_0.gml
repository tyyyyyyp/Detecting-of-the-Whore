// Якщо затемнення ще не завершено
if (fading_in) {
    global.fade_alpha += fade_speed; // Поступове затемнення
    global.fade_alpha = min(global.fade_alpha, 1); // Переконуємось, що alpha не перевищить 1

    if (global.fade_alpha >= 1) {
        fading_in = false; // Зупиняємо процес затемнення
        room_goto_next(); // Переходимо до наступної кімнати
    }
}
