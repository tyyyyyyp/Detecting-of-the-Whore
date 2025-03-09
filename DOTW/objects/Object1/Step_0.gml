input_left = keyboard_check(ord("A"));
input_right = keyboard_check(ord("D"));
input_up = keyboard_check(ord("W"));
input_down = keyboard_check(ord("S"));

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


// Smooth camera follow using lerp()
view_xview[0] = lerp(view_xview[0], Object1.x - (view_wview[0] / 2), 0.1);
view_yview[0] = lerp(view_yview[0], Object1 .y - (view_hview[0] / 2), 0.1);

if(place_meeting(x, y + 2, my_tilemap))

move_and_collide(move_x, move_y, my_tilemap);
