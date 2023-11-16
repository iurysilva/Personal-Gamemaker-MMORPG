function scr_player_walking(){
	horizontal_speed = (keys[KEY_RIGHT]-keys[KEY_LEFT])
	vertical_speed = (keys[KEY_UP]-keys[KEY_DOWN])
	velocity_direction = point_direction(x, y, x + horizontal_speed, y + vertical_speed)
	
	if (horizontal_speed != 0 or vertical_speed != 0) walking_speed = 2
	else walking_speed = 0
	
	horizontal_speed = lengthdir_x(walking_speed, velocity_direction)
	vertical_speed = lengthdir_y(walking_speed, velocity_direction)
	
	if (place_meeting(x + horizontal_speed, y, obj_player)){
	while(!place_meeting(x + sign(horizontal_speed), y, obj_player)){
		x += sign(horizontal_speed)
	}
	horizontal_speed = 0
	}	

	x += horizontal_speed 


	if (place_meeting(x, y - vertical_speed, obj_player)){
	while(!place_meeting(x, y - sign(vertical_speed), obj_player)){
		y -= sign(vertical_speed)
	}
	vertical_speed = 0
	}

	y -= vertical_speed
}