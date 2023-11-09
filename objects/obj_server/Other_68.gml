var event_id = async_load[? "id"]

if server == event_id{
	var type = async_load[? "type"]
	var sock = async_load[? "socket"]
	
	if (type == network_type_connect){
		ds_list_add(sockets, sock)
		
		var player = instance_create_layer(100, 100+32*sock, "Instances", obj_player)
		ds_map_add(clients, sock, player)
		for (var i = 0; i< instance_number(obj_player); i++){
			var pl = instance_find(obj_player, i)
			for (var s = 0; s < ds_list_size(sockets); s++){
				var sock = ds_list_find_value(sockets, s)	
				SendRemoteEntity(sock, ENTITY_X, pl.id, pl.x)
				SendRemoteEntity(sock, ENTITY_Y, pl.id, pl.y)
				SendRemoteEntity(sock, ENTITY_NAME, pl.id, pl.name)
				SendRemoteEntity(sock, ENTITY_SPRITE, pl.id, pl.sprite_index)
			}
		}
	}
	
	if (type == network_type_disconnect){
		var player = clients[? sock]
		
		for (var i = 0; i < ds_list_size(sockets); i++){
			var s = ds_list_find_value(sockets, i)	
			SendRemoteEntity(s, ENTITY_DESTROY, player.id, player.x)
		}
		
		if(instance_exists(player)){
			with(player){
				instance_destroy()	
			}
		}
		
		ds_list_delete(sockets, ds_list_find_index(sockets, sock))
		ds_map_delete(clients, sock)
	}
}

else if event_id != global.socket{
	var sock = async_load[? "id"]
	var buff = async_load[? "buffer"]
	
	buffer_seek(buff, buffer_seek_start, 0)
	var cmd = buffer_read(buff, buffer_u8)
	
	var player = clients[? sock]
	switch (cmd){
		case PACKET_KEY:
			with(player){
				var key = buffer_read(buff, buffer_u8)
				var state = buffer_read(buff, buffer_u8)
				keys[key] = state 
			}
		break
		
		case PACKET_NAME:
			player.name = buffer_read(buff, buffer_string)
			for (var s = 0; s < ds_list_size(sockets); s++){
				var sock = ds_list_find_value(sockets, s)	
				SendRemoteEntity(sock, ENTITY_NAME, player.id, player.name)
			}
	}
}