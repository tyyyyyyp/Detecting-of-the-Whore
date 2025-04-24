var spawn_x = random_range(100, 700);
var spawn_y = random_range(100, 500);

if (random(100) < 50) {
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy);
} else {
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy_2);
}

instance_destroy()