for (var _i = 0; _i< instance_number(obj_player); _i++){
	var _client_player = instance_find(obj_player, _i)
	for (var _s = 0; _s < ds_list_size(sockets); _s++){
		var _client_sock = ds_list_find_value(sockets, _s)	
		scr_send_remote_entity(_client_sock, ENTITY_X, _client_player.id, _client_player.x)
		scr_send_remote_entity(_client_sock, ENTITY_Y, _client_player.id, _client_player.y)
	}
}