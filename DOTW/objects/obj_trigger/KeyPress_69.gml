  if (distance_to_object(Object1) < 50 && keyboard_check_pressed(ord("E")))
{
    // Створюємо об'єкт затемнення
    var fade_obj = instance_create_layer(0, 0, "Instances", obj_fade);
    fade_obj.fading_in = true;  // Починаємо затемнення
}
