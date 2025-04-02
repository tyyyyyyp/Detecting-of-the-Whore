// Ініціалізація змінних
button_text = "MAGIC"; // Текст на кнопці
function activate() {
    switch (button_text) {
        case "MAGIC":
            magic_attack(); // Викликаємо магічну атаку
            break;
        case "HEAL":
            heal(); // Викликаємо лікування
            break;
        case "SAFE":
            spare(); // Викликаємо пощаду
            break;
    }
}
