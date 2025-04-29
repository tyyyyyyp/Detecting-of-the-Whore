var current_datetime = date_current_datetime(); // Отримуємо поточну дату й час
var month = date_get_month(current_datetime);   // Витягуємо місяць

if (month == 12 || month == 1 || month == 2) {
    season_text = "so what? coldly";
} else if (month >= 3 && month <= 5) {
    season_text = "ready?";
} else if (month >= 6 && month <= 8) {
    season_text = "go wash yourself";
} else if (month >= 9 && month <= 11) {
    season_text = "GO TO SCHOOL";
} else {
    season_text = "pu-pu-pu";
}
season_text_surface = -1; // Поки що порожня поверхня
rotation = 10;
rotation_direction = 1; // 1 — збільшується, -1 — зменшується
