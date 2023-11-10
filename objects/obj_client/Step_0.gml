if (keyboard_check_pressed(vk_left)){
	SendKey(KEY_LEFT, true)
}

if (keyboard_check_released(vk_left)){
	SendKey(KEY_LEFT, false)	
}
 
 if (keyboard_check_pressed(vk_right)){
	SendKey(KEY_RIGHT, true)	
}

if (keyboard_check_released(vk_right)){
	SendKey(KEY_RIGHT, false)	
}
 
if (keyboard_check_pressed(vk_up)){
	SendKey(KEY_UP, true)
}

if (keyboard_check_released(vk_up)){
	SendKey(KEY_UP, false)	
}
 
 if (keyboard_check_pressed(vk_down)){
	SendKey(KEY_DOWN, true)	
}

if (keyboard_check_released(vk_down)){
	SendKey(KEY_DOWN, false)	
}

for (var i = 0; i < instance_number(obj_remote_entity); i++){
	var instance = instance_find(obj_remote_entity, i)
	if (my_id == instance.my_id){
		target = instance
		break
	}
}

if (target != noone){
	camera_set_view_target(view_camera[0], instance)
	camera_set_view_border(view_camera[0], view_wport[0]/2, view_hport[0]/2)
}
