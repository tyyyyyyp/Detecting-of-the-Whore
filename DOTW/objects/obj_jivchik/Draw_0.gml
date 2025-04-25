draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle); // центр по вертикалі

var text = season_text;
var scale_x = 1;
var scale_y = 1;

var center_x = 477;
var center_y = 444;

// Створюємо матрицю трансформації
var mat = matrix_build(center_x, center_y, 0, 0, 0, rotation, scale_x, scale_y, 1);

// Зберігаємо попередню матрицю
var old_matrix = matrix_get(matrix_world);

// Встановлюємо нову
matrix_set(matrix_world, mat);

// Малюємо текст у (0, 0), бо тепер (0,0) — це центр обертання
draw_set_color(c_silver);
draw_text(0, 0, text);

// Повертаємо стару матрицю
matrix_set(matrix_world, old_matrix);
