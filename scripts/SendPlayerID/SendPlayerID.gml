function SendPlayerID(sock){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_MYID)
	buffer_write(buffer, buffer_u8, sock)
	network_send_packet(sock, buffer, buffer_tell(buffer))
}