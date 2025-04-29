// Створюємо глобальні змінні, якщо вони ще не існують
if (!variable_global_exists("inventory")) global.inventory = [];
if (!variable_global_exists("equipped_item")) global.equipped_item = "";

// Перевірка на наявність інвентаря
if (global.inventory == undefined) {
    global.inventory = [];  // Якщо інвентар не ініціалізований, створюємо масив
}

// Відкриваємо файл для запису
ini_open("save.sav");

// Збереження позиції та кімнати
ini_write_real("player", "x", obj_player_2.x);
ini_write_real("player", "y", obj_player_2.y);
ini_write_real("player", "room", room);

// Збереження одягнутого предмета
ini_write_string("player", "equipped", global.equipped_item);  // Зберігаємо тільки одягнутий предмет

// Очистка старих записів інвентаря в файлі
var i = 0;
while (ini_key_exists("inventory", "item" + string(i))) {
    ini_write_string("inventory", "item" + string(i), "");
    i++;
}

// Збереження нового інвентаря
for (var j = 0; j < array_length(global.inventory); j++) {
    ini_write_string("inventory", "item" + string(j), global.inventory[j]);
}

// Закриваємо INI файл
ini_close();

// Виводимо повідомлення для перевірки
show_debug_message("Інвентар збережено! Позиція: (" + string(obj_player_2.x) + ", " + string(obj_player_2.y) + ")");
