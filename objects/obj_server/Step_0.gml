for (var i = 0; i< instance_number(obj_player); i++){
	var pl = instance_find(obj_player, i)
	for (var s = 0; s < ds_list_size(sockets); s++){
		var sock = ds_list_find_value(sockets, s)	
		SendRemoteEntity(sock, ENTITY_X, pl.id, pl.x)
		SendRemoteEntity(sock, ENTITY_Y, pl.id, pl.y)
	}
}