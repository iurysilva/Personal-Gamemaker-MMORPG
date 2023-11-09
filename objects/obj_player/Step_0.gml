horizontal_speed = (keys[KEY_RIGHT]-keys[KEY_LEFT]) * walking_speed

//if place_meeting(x + horizontal_speed, y, obj_remote_entity){
//	while(!place_meeting(x + sign(horizontal_speed), y, obj_remote_entity)){
//		x += sign(horizontal_speed)
//	}
//	horizontal_speed = 0
//}

x += horizontal_speed 


vertical_speed = walking_speed*(keys[KEY_UP]-keys[KEY_DOWN])

//if place_meeting(y + vertical_speed, y, obj_remote_entity){
//	while(!place_meeting(y + sign(vertical_speed), y, obj_remote_entity)){
//		y += sign(vertical_speed)
//	}
//	vertical_speed = 0
//}

y -= vertical_speed 
