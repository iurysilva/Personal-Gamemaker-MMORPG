var _event_id = async_load[? "id"]

if server == _event_id{
	var _type = async_load[? "type"]
	var _sock = async_load[? "socket"]
	
	if (_type == network_type_connect){
		ds_list_add(sockets, _sock)
		
		var _player = instance_create_layer(100, 100+32*_sock, "Instances", obj_player)
		_player.my_id = _sock
		ds_map_add(clients, _sock, _player)
		for (var _i = 0; _i< instance_number(obj_player); _i++){
			var _client_player = instance_find(obj_player, _i)
			for (var _s = 0; _s < ds_list_size(sockets); _s++){
				var _client_sock = ds_list_find_value(sockets, _s)	
				scr_send_remote_player(_client_sock, ENTITY_X, _client_player.id, _client_player.x)
				scr_send_remote_player(_client_sock, ENTITY_Y, _client_player.id, _client_player.y)
				scr_send_remote_player(_client_sock, ENTITY_NAME, _client_player.id, _client_player.name)
				scr_send_remote_player(_client_sock, ENTITY_SPRITE, _client_player.id, _client_player.sprite_index)
				scr_send_remote_player(_client_sock, ENTITY_MYID, _client_player.id, _client_player.my_id)
			}
		}
	}
	
	if (_type == network_type_disconnect){
		var _player = clients[? _sock]
		
		for (var _i = 0; _i < ds_list_size(sockets); _i++){
			var _s = ds_list_find_value(sockets, _i)	
			scr_send_remote_player(_s, ENTITY_DESTROY, _player.id, _player.x)
		}
		
		if(instance_exists(_player)){
			with(_player){
				instance_destroy()	
			}
		}
		
		ds_list_delete(sockets, ds_list_find_index(sockets, _sock))
		ds_map_delete(clients, _sock)
	}
}

else if _event_id != global.socket{
	var _sock = async_load[? "id"]
	var _buff = async_load[? "buffer"]
	
	buffer_seek(_buff, buffer_seek_start, 0)
	var _packet_type = buffer_read(_buff, buffer_u8)
	
	var _player = clients[? _sock]
	switch (_packet_type){
		case PACKET_KEY:
			with(_player){
				var _key = buffer_read(_buff, buffer_u8)
				var _state = buffer_read(_buff, buffer_u8)
				keys[_key] = _state 
			}
		break
		
		case PACKET_NAME:
			_player.name = buffer_read(_buff, buffer_string)
			for (var _s = 0; _s < ds_list_size(sockets); _s++){
				var _client_sock = ds_list_find_value(sockets, _s)	
				scr_send_remote_player(_client_sock, ENTITY_NAME, _player.id, _player.name)
			}
		case PACKET_MYID:
			scr_send_player_id(_sock)
		break
		
		case PACKET_SPRITE:
			_player.sprite_index = buffer_read(_buff, buffer_u16)
			for (var _s = 0; _s < ds_list_size(sockets); _s++){
				var _client_sock = ds_list_find_value(sockets, _s)	
				scr_send_remote_player(_client_sock, ENTITY_SPRITE, _player.id, _player.sprite_index)
			}
		break
			
		case PACKET_DASH:
			var _is_dashing = buffer_read(_buff, buffer_bool)
			if _is_dashing{
				var _mouse_x = buffer_read(_buff, buffer_s16)
				var _mouse_y = buffer_read(_buff, buffer_s16)
				_player.dash_direction = point_direction(_player.x, _player.y, _mouse_x, _mouse_y)
				_player.state = scr_character_dashing
			}
			else{
				_player.dash_direction = -1
				_player.state = scr_character_walking	
			}
		break
	}
}