if (keyboard_check_pressed(vk_down)){
	current_index ++
}
if (keyboard_check_pressed(vk_up)){
	current_index --
}

current_index = clamp(current_index, 0, array_length_1d(menu) - 1)

if (keyboard_check_pressed(vk_enter)){
	switch(current_index){
		case 0:
			instance_create_layer(0, 0, "Instances", obj_server)
			room_goto_next()
		break
	
		case 1:
			room_goto_next()
			break
	
		case 2:
			game_end()
			break
	}
}