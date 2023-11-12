function scr_send_player_id(_sock){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_MYID)
	buffer_write(buffer, buffer_u8, _sock)
	network_send_packet(_sock, buffer, buffer_tell(buffer))
}