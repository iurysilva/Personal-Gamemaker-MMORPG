#macro ENTITY_X 0
#macro ENTITY_Y 1
#macro ENTITY_NAME 2
#macro ENTITY_SPRITE 3
#macro ENTITY_DESTROY 4

function SendRemoteEntity(sock, entity_information_type, entity_id, entity_information){
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_ENTITY)
	buffer_write(buffer, buffer_u8, entity_information_type)
	buffer_write(buffer, buffer_u32, entity_id)
	
	switch(entity_information_type){
		case ENTITY_X: 
			buffer_write(buffer, buffer_s16, entity_information)
		break
		case ENTITY_Y: 
			buffer_write(buffer, buffer_s16, entity_information)
		break
		case ENTITY_NAME: 
			buffer_write(buffer, buffer_string, entity_information)
		break
		case ENTITY_SPRITE: 
			buffer_write(buffer, buffer_u16, entity_information)
		break
		case ENTITY_DESTROY: 
			buffer_write(buffer, buffer_u8, entity_information)
		break
	}
	
	network_send_packet(sock, buffer, buffer_tell(buffer))
}