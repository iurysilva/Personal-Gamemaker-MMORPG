function scr_send_remote_dash(_sock, _x, _y, _sprite){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_REMOTE_DASH)
	buffer_write(buffer, buffer_s16, _x)
	buffer_write(buffer, buffer_s16, _y)
	buffer_write(buffer, buffer_u16, _sprite)
	network_send_packet(_sock, buffer, buffer_tell(buffer))
}