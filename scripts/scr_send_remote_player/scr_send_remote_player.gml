function scr_send_remote_player(_sock, _entity_information_type, _entity_id, _entity_information){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_REMOTE_PLAYER)
	buffer_write(buffer, buffer_u8, _entity_information_type)
	buffer_write(buffer, buffer_u32, _entity_id)
	
	switch(_entity_information_type){
		case ENTITY_X: 
			buffer_write(buffer, buffer_s16, _entity_information)
		break
		case ENTITY_Y: 
			buffer_write(buffer, buffer_s16, _entity_information)
		break
		case ENTITY_NAME: 
			buffer_write(buffer, buffer_string, _entity_information)
		break
		case ENTITY_SPRITE: 
			buffer_write(buffer, buffer_u16, _entity_information)
		break
		case ENTITY_DESTROY: 
			buffer_write(buffer, buffer_u8, _entity_information)
		break
		case ENTITY_MYID:
			buffer_write(buffer, buffer_u8, _entity_information)
		break
	}

	network_send_packet(_sock, buffer, buffer_tell(buffer))
}