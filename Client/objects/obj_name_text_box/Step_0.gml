if (string_length(keyboard_string)<limit) 
    message = keyboard_string;
else
    keyboard_string = message;
	
if (keyboard_check_pressed(vk_enter)){
	global.name = message
	room_goto_next()
}
