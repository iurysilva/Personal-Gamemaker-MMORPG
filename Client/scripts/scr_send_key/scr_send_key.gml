function scr_send_key(_key, _state){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_KEY)
	buffer_write(buffer, buffer_u8, _key)
	buffer_write(buffer, buffer_u8, _state)
	network_send_packet(socket, buffer, buffer_tell(buffer))
}
