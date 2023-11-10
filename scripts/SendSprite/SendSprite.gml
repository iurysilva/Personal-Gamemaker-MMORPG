function SendSprite(player_sprite){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_SPRITE)
	buffer_write(buffer, buffer_u16, player_sprite)
	network_send_packet(socket, buffer, buffer_tell(buffer))
}