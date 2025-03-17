draw_set_font(Font1);
 //Draws the scrolling text.
 draw_text_scrolling(24, 90, text_string, 0.3, 60, undefined);
 //Resets the scrolling text.
 if keyboard_check_pressed(vk_space){
     draw_text_reset();
     text_string = "This is a new message.";
 }