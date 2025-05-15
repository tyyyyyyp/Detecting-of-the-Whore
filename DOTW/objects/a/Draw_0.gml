if (showing_text && current_line < array_length(text_lines)) {
    draw_set_font(Font1);
	draw_set_color(c_white)
    draw_text(x + 100, y - 100, string_copy(text_lines[current_line], 1, current_char));
}
