function scr_send_disconnection(){
	ds_map_add(data_to_send, "packetType", PACKET_DISCONNECTION)
	ds_map_add(data_to_send, "id", my_id)
	
	var _json_data = json_encode(data_to_send)
	ds_map_clear(data_to_send)
	
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_text, _json_data)
	network_send_udp_raw(socket, server_address, server_port, buffer, buffer_tell(buffer))
}