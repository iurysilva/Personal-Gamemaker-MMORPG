function scr_send_dash(_is_dashing, _mouse_x, _mouse_y){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_DASH)
	buffer_write(buffer, buffer_bool, _is_dashing)
	if _is_dashing{
		buffer_write(buffer, buffer_s16, _mouse_x)
		buffer_write(buffer, buffer_s16, _mouse_y)	
	}
	network_send_packet(socket, buffer, buffer_tell(buffer))
}