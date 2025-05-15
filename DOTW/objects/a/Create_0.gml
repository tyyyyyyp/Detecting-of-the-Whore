// Ініціалізація змінних для таймера і тексту
text_time = -1;  // Текст не відображається, поки не натиснуто клавішу
text_to_show = "Ви натиснули 'E'!";  // Текст, який ми будемо показувати
current_char = 0;  // Позиція символа, який відображається
text_display_time = -1;  // Час для відліку після повного появлення тексту
global.room_texts = ds_map_create();

// Додаємо текст для конкретних кімнат
ds_map_add(global.room_texts,rm_trash , "abcd");
ds_map_add(global.room_texts, rm_gost, "ifg");
ds_map_add(global.room_texts, Room4, "dfasdf!" + "fsdfdfg");
// У Create Event або десь один раз
text_lines = [
];
current_line = 0;
current_char = 0;
text_time = -1;
text_display_time = -1;
line_delay = 720; // затримка перед наступним рядком
showing_text = false;
