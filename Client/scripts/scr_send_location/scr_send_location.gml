function scr_send_location(_x, _y, _sprite,){
	ds_map_add(data_to_send, "packetType", PACKET_LOCATION)
	ds_map_add(data_to_send, "id", my_id)
	ds_map_add(data_to_send, "x", _x)
	ds_map_add(data_to_send, "y", _y)
	ds_map_add(data_to_send, "sprite", _sprite)
	
	var _json_data = json_encode(data_to_send)
	ds_map_clear(data_to_send)
	
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_text, _json_data)
	network_send_udp_raw(socket, server_address, server_port, buffer, buffer_tell(buffer))
}