draw_self()



// Відображення здоров'я
draw_set_color(c_red);
draw_rectangle(10, 10, 10 + (health / max_health) * 200, 30, false);

// Відображення мани
draw_set_color(c_blue);
draw_rectangle(10, 40, 10 + (mana / max_mana) * 200, 60, false);

// Текст для показу значень
draw_set_color(c_white);
draw_text(10, 70, "Health: " + string(health));
draw_text(10, 90, "Mana: " + string(mana));
