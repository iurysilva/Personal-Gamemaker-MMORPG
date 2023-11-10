if (keyboard_check(ord("A"))){
	SendKey(KEY_LEFT, true)
	SendSprite(spr_character_running_left)
}

if (keyboard_check_released(ord("A"))){
	SendKey(KEY_LEFT, false)	
	SendSprite(spr_character_still_left)	
}
 
 if (keyboard_check(ord("D"))){
	SendKey(KEY_RIGHT, true)	
	SendSprite(spr_character_running_right)
}

if (keyboard_check_released(ord("D"))){
	SendKey(KEY_RIGHT, false)	
	SendSprite(spr_character_still_right)
}
 
if (keyboard_check(ord("W"))){
	SendKey(KEY_UP, true)
	SendSprite(spr_character_running_up)
}

if (keyboard_check_released(ord("W"))){
	SendKey(KEY_UP, false)	
	SendSprite(spr_character_still_up)
}
 
 if (keyboard_check(ord("S"))){
	SendKey(KEY_DOWN, true)
	SendSprite(spr_character_running_down)
}

if (keyboard_check_released(ord("S"))){
	SendKey(KEY_DOWN, false)	
	SendSprite(spr_character_still_down)
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
