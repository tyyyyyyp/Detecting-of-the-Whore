item_id = "wind staff"; // Або унікальний ідентифікатор, наприклад: "sword", "key", тощо
if (variable_global_exists("inventory")) {
    if (array_contains(global.inventory, item_id)) {
        instance_destroy(); // Цей предмет вже у гравця — не показуємо його
    }
}
if (array_contains(global.inventory, item_id)) {
    instance_destroy(); // Гравець вже підняв цей предмет
}
