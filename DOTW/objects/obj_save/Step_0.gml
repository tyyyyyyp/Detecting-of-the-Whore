if place_meeting(x,y, obj_player_2){
if file_exists("save.sav"){
	file_delete("save.sav")
}

ini_open("save.sav")
var savedR = room;
ini_write_real("save1","room",savedR);
ini_write_real("save1","x",obj_player_2.x);
ini_write_real("save1","y",obj_player_2.y);

}