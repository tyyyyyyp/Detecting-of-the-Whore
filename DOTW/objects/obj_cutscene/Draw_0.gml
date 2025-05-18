// Затінення заднього плану
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1);

// Малюємо текст, якщо ми в процесі показу
if (state == "showing") {
    draw_set_color(c_white);
    draw_text(text_x, 200, texts[text_index]);
}
