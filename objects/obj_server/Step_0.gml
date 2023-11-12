for (var _i = 0; _i< instance_number(obj_player); _i++){
	var _client_player = instance_find(obj_player, _i)
	for (var _s = 0; _s < ds_list_size(sockets); _s++){
		var _client_sock = ds_list_find_value(sockets, _s)	
		scr_send_remote_player(_client_sock, ENTITY_X, _client_player.id, _client_player.x)
		scr_send_remote_player(_client_sock, ENTITY_Y, _client_player.id, _client_player.y)
		if (_client_player.state == scr_character_dashing){
			var _dash_object = instance_create_layer(_client_player.x, _client_player.y, "Instances", obj_dash)
			_dash_object.sprite_index = _client_player.sprite_index
			scr_send_remote_dash(_client_sock, _client_player.x, _client_player.y, _client_player.sprite_index)
		}
	}
}
