// Movement
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));

var _min_x = 100;
var _max_x = 1000;
var _min_y = 200;
var _max_y = 800;

var _hdir = _key_right - _key_left;
var _vdir = _key_down - _key_up;

if (_hdir != 0 or _vdir != 0) {
    var _ang = point_direction(0, 0, _hdir, _vdir);
    var _x = lengthdir_x(move_speed, _ang);
    var _y = lengthdir_y(move_speed, _ang);
    x += _x;
    y += _y;
}
x = clamp(x, _min_x, _max_x);
y = clamp(y, _min_y, _max_y);

// Health Regeneration (Limit Health Regeneration)
if (health < max_health) {
    health += health_regen_rate;  // Regenerate health
    health = min(health, max_health);  // Ensure health doesn't exceed max_health
}

// Mana Regeneration
mana = min(mana + mana_regen_rate, max_mana);  // Ensure mana doesn't exceed max_mana

// Damage Handling
if (health > 0) {
    // Health and damage logic
    // This part handles the damage logic (like from bullets or other sources)
}

// Cooldown for taking damage
hurt_cooldown += 1;

// Check if the cooldown is over
if (hurt_cooldown >= hurt_time) {
    hurt_cooldown = 0;  // Reset the cooldown
}

// Interaction with Magic Button
var distance_to_button = point_distance(x, y, obj_button_magic.x, obj_button_magic.y);
if (distance_to_button <= 50) {
    draw_set_color(c_yellow);
    draw_circle(obj_button_magic.x, obj_button_magic.y, 10, false);
}

// Ensure health never goes below 0
health = max(health, 0);
