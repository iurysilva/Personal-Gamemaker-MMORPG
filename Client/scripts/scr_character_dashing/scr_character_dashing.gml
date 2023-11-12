function scr_character_dashing(){
	horizontal_speed = lengthdir_x(dash_velocity, dash_direction)
	vertical_speed = lengthdir_y(dash_velocity, dash_direction)
	x += horizontal_speed
	y += vertical_speed
}