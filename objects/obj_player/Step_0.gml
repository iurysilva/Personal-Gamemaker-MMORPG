horizontal_speed = (keys[KEY_RIGHT]-keys[KEY_LEFT]) * walking_speed

if (place_meeting(x + horizontal_speed, y, obj_player)){
	while(!place_meeting(x + sign(horizontal_speed), y, obj_player)){
		x += sign(horizontal_speed)
	}
	horizontal_speed = 0
}	

x += horizontal_speed 


vertical_speed = (keys[KEY_UP]-keys[KEY_DOWN]) * walking_speed

if (place_meeting(x, y - vertical_speed, obj_player)){
	while(!place_meeting(x, y - sign(vertical_speed), obj_player)){
		y -= sign(vertical_speed)
	}
	vertical_speed = 0
}

y -= vertical_speed
