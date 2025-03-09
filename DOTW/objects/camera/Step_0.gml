if (follow != noone)
{
	xTo = follow.x;
	xTo = follow.y;
}

x += (xTo - x)/25;
y += (xTo - y)/25

camera_set_view_pos(view_camera[0],x-(camWidht*0.5),y-(camHeight*0.5));