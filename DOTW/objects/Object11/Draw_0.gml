// Якщо текст має бути показаний
if (text_time != -1 && current_char > 0) {
    // Малюємо лише частину тексту до поточного символу
    draw_text(x + 30, y - 100, string_copy(text_to_show, 1, current_char));
}
