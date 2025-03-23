// Відображення тексту на екрані в GameMaker
if (point_distance(obj_player.x, obj_player.y, x, y) < 100) {
    draw_text(x + 10, y - 20, "Натисніть 'E' для взаємодії");
}
