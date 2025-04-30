if file_exists("save.sav"){
	ini_open("save.sav");
	startRoom = ini_read_real("save1","room",rm_trash)
	startX = ini_read_real("save1","x",669)
	startY = ini_read_real("save1","y",1728)
	ini_close()
}