if file_exists("save.sav"){
ini_open("save.sav");
startRoom = ini_read_real("save1","room",rm_trash);
startX = ini_read_real("save1","x",0);
startY = ini_read_real("save1","y",0)
ini_close()
}