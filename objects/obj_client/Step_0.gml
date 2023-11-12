if (keyboard_check(ord("A"))){
	scr_send_key(KEY_LEFT, true)
	scr_send_sprite(spr_character_running_left)
}

if (keyboard_check_released(ord("A"))){
	scr_send_key(KEY_LEFT, false)	
	scr_send_sprite(spr_character_still_left)	
}
 
 if (keyboard_check(ord("D"))){
	scr_send_key(KEY_RIGHT, true)	
	scr_send_sprite(spr_character_running_right)
}

if (keyboard_check_released(ord("D"))){
	scr_send_key(KEY_RIGHT, false)	
	scr_send_sprite(spr_character_still_right)
}
 
if (keyboard_check(ord("W"))){
	scr_send_key(KEY_UP, true)
	scr_send_sprite(spr_character_running_up)
}

if (keyboard_check_released(ord("W"))){
	scr_send_key(KEY_UP, false)	
	scr_send_sprite(spr_character_still_up)
}
 
 if (keyboard_check(ord("S"))){
	scr_send_key(KEY_DOWN, true)
	scr_send_sprite(spr_character_running_down)
}

if (keyboard_check_released(ord("S"))){
	scr_send_key(KEY_DOWN, false)	
	scr_send_sprite(spr_character_still_down)
}

for (var _i = 0; _i < instance_number(obj_remote_entity); _i++){
	var _instance = instance_find(obj_remote_entity, _i)
	if (my_id == _instance.my_id){
		target = _instance
		break
	}
}

if (mouse_check_button_pressed(mb_right)){
	alarm[0] = 8
	scr_send_dash(true, mouse_x, mouse_y)
}

if (target != noone){
	camera_set_view_target(view_camera[0], target)
	camera_set_view_border(view_camera[0], view_wport[0]/2, view_hport[0]/2)
}
