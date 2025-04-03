// Draw the player's sprite (this line is for the player’s basic draw call)
draw_self();

// Health Bar with margin and background
draw_set_color(c_black);  // Set color for background
draw_rectangle(5, 5, 205, 35, false);  // Background for health bar with margin

// Draw Health Bar (with margin)
draw_set_color(c_red);
draw_rectangle(10, 10, 10 + (health / max_health) * 200, 30, false);

// Mana Bar with margin and background
draw_set_color(c_black);  // Set color for background
draw_rectangle(5, 35, 205, 65, false);  // Background for mana bar with margin

// Draw Mana Bar (with margin)
draw_set_color(c_blue);
draw_rectangle(10, 40, 10 + (mana / max_mana) * 200, 60, false);

// Draw Text for Health and Mana
draw_set_color(c_white);
draw_set_font(Font1);
draw_text(10, 70, "Health: " + string(health));
draw_text(10, 90, "Mana: " + string(mana));
