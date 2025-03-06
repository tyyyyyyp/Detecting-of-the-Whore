input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);

 movement_x = input_right - input_left;
 movement_y = input_down - input_up;
 
 if (movement_x > 0) {
  sprite_index = mango_right;
 }
 else if (movement_x < 0) {
  sprite_index = mango_left;
 }
 else {
  if (sprite_index == mango_left) {
   sprite_index = manstnd9;
  }
 
  if (sprite_index == mango_right) {
   sprite_index = manstnd8;
  }
 }
 
  if (movement_y > 0) {
  sprite_index = mango_down;
 }
 else if (movement_y < 0) {
  sprite_index = mango_up;
 }
 else {
  if (sprite_index == mango_down) {
   sprite_index = manstand_sad;
  }
 
  if (sprite_index == mango_up) {
   sprite_index = manstand_happy;
  }
 }

x += movement_speed * movement_x;
y += movement_speed * movement_y;