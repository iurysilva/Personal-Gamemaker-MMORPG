if (string_length(keyboard_string)<limit) 
    message = keyboard_string;
else
    keyboard_string = message;
	
if (keyboard_check_pressed(vk_enter)){
	if (global.create_server == true) instance_create_layer(0, 0, "Instances", obj_server)
	global.name = message
	room_goto_next()
}
