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


if (mouse_check_button_pressed(mb_right)){
	alarm[0] = 8
	_player.client_mouse_x = mouse_x
	_player.client_mouse_y = mouse_y
	_player.state = scr_player_dashing
}

if (_player and _player.state == scr_player_dashing){
	var _obj_dash = instance_create_layer(_player.x, _player.y, "Instances", obj_dash)
	_obj_dash.sprite_index = _player.sprite_index
	scr_send_location(_player.x, _player.y, _player.sprite_index)
	scr_send_dash(_player.x, _player.y, _player.sprite_index)
}

if (_player){
	camera_set_view_target(view_camera[0], _player)
	camera_set_view_border(view_camera[0], view_wport[0]/2, view_hport[0]/2)	
}	
		