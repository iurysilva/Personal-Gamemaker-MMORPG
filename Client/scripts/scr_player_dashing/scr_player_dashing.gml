function scr_player_dashing(){
	dash_direction = point_direction(x, y, client_mouse_x, client_mouse_y)
	horizontal_speed = lengthdir_x(dash_velocity, dash_direction)
	vertical_speed = lengthdir_y(dash_velocity, dash_direction)
	x += horizontal_speed
	y += vertical_speed
}