// Ініціалізація масивів в Create Event
if (global.inventory == undefined) {
    global.inventory = array_create(8, 0);  // 8 слотів для інвентаря, кожен спочатку порожній
}
if (global.items_picked == undefined) {
    global.items_picked = array_create(8, false);  // 8 предметів, по замовчуванню — не підібрані
}

selected_slot = 0;  // Ініціалізація вибраного слота

global.item_list = [
    {id: 1, name: "Wind Staff", atk: 5, type: "weapon"}  // Новий предмет
];
