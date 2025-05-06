// Встановлюємо тип предмету, наприклад, Wind Staff (ID = 5)
item_id = 2;  // ID предмету "Wind Staff"
if (!variable_global_exists("items_picked")) {
    global.items_picked = array_create(100, false); // Під 100 предметів, змінюй при потребі
}
item_uid = 1; // Унікальний номер для кожного предмета, не дублюй!
