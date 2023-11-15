var _player = entities[? my_id]
if (keyboard_check(ord("A"))){
	_player.keys[KEY_LEFT] = true
	_player.sprite_index = spr_character_running_left
	scr_send_location(_player.x, _player.y, spr_character_running_left)
}

if (keyboard_check_released(ord("A"))){
	_player.keys[KEY_LEFT] = false	
	_player.sprite_index = spr_character_still_left
	scr_send_location(_player.x, _player.y, spr_character_still_left)	
}
 
 if (keyboard_check(ord("D"))){
	_player.keys[KEY_RIGHT] = true
	_player.sprite_index = spr_character_running_right
	scr_send_location(_player.x, _player.y, spr_character_running_right)
}

if (keyboard_check_released(ord("D"))){
	_player.keys[KEY_RIGHT] = false
	_player.sprite_index = spr_character_still_right
	scr_send_location(_player.x, _player.y, spr_character_still_right)
}
 
if (keyboard_check(ord("W"))){
	_player.keys[KEY_UP] = true
	_player.sprite_index = spr_character_running_up
	scr_send_location(_player.x, _player.y, spr_character_running_up)
}

if (keyboard_check_released(ord("W"))){
	_player.keys[KEY_UP] = false
	_player.sprite_index = spr_character_still_up
	scr_send_location(_player.x, _player.y, spr_character_still_up)
}
 
 if (keyboard_check(ord("S"))){
	_player.keys[KEY_DOWN] = true
	_player.sprite_index = spr_character_running_down
	scr_send_location(_player.x, _player.y, spr_character_running_down)
}

if (keyboard_check_released(ord("S"))){
	_player.keys[KEY_DOWN] = false
	_player.sprite_index = spr_character_still_down
	scr_send_location(_player.x, _player.y, spr_character_still_down)
}

for (var _i = 0; _i < instance_number(obj_player); _i++){
	var _instance = instance_find(obj_player, _i)
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
