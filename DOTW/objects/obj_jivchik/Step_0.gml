rotation += rotation_direction * 0.2; // плавніше, ніж 1 градус за кадр

if (rotation >= 5) {
    rotation = 5;
    rotation_direction = -1;
}
else if (rotation <= -5) {
    rotation = -5;
    rotation_direction = 1;
}
