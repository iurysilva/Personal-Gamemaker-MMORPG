var _buffer = async_load[? "buffer"]
buffer_seek(_buffer, buffer_seek_start, 0)
var _json_server_data = buffer_read(_buffer, buffer_string)
var _data = json_decode(_json_server_data)

var _packet_type = ds_map_find_value(_data, "packetType")
var _id = ds_map_find_value(_data, "id")
switch(_packet_type){	
	case PACKET_CONNECTION:
		var _x = ds_map_find_value(_data, "x")
		var _y = ds_map_find_value(_data, "y")
		var _name = ds_map_find_value(_data, "name")
		var _sprite = ds_map_find_value(_data, "sprite")
		var _is_remote_player = ds_map_find_value(_data, "isRemotePlayer")
		var _remote_entity = instance_create_layer(_x, _y, "Instances", obj_player)
		_remote_entity.name = _name
		_remote_entity.my_id = _id
		ds_map_set(entities, _id, _remote_entity)
		if (!_is_remote_player) my_id = _id
	break
	
	case PACKET_LOCATION:
		var _x = ds_map_find_value(_data, "x")
		var _y = ds_map_find_value(_data, "y")
		var _sprite = ds_map_find_value(_data, "sprite")
		var _remote_entity = entities[? _id]
		_remote_entity.x = _x
		_remote_entity.y = _y
		_remote_entity.sprite_index = _sprite
	break
	
	case PACKET_DISCONNECTION:
		var _remote_entity = entities[? _id]
		ds_map_delete(entities, _id)
		with(_remote_entity){
			instance_destroy()	
		}
	break
}

	//switch(_packet_type){
	//switch(_packet_type){
	//	case PACKET_REMOTE_PLAYER:
	//		var _entity_information_type = buffer_read(_buff, buffer_u8)
	//		var _entity_id = buffer_read(_buff, buffer_string)
	//		if !ds_map_exists(entities, _entity_id){
	//			var _remote_entity = instance_create_layer(0, 0, "Instances", obj_remote_player)
	//			ds_map_set(entities, _entity_id, _remote_entity)
	//		}
			
	//		var _remote_entity = entities[? _entity_id]
			
	//		switch(_entity_information_type){
	//			case ENTITY_X: 
	//				_remote_entity.x = buffer_read(_buff, buffer_s16)
	//			break
	//			case ENTITY_Y: 
	//				_remote_entity.y = buffer_read(_buff, buffer_s16)
	//			break
	//			case ENTITY_SPRITE: 
	//				_remote_entity.sprite_index = buffer_read(_buff, buffer_u16)
	//			break
	//			case ENTITY_NAME:
	//				_remote_entity.name = buffer_read(_buff, buffer_string)
	//			break
	//			case ENTITY_DESTROY: 
	//				buffer_read(_buff, buffer_u8)
	//				ds_map_delete(entities, _entity_id)
	//				with(_remote_entity){
	//					instance_destroy()	
	//				}
	//			break
	//			case ENTITY_MYID:
	//				_remote_entity.my_id = buffer_read(_buff, buffer_u8)
	//			break
	//		}			
	//	break
		
	//	case PACKET_MYID:
	//		my_id = buffer_read(_buff, buffer_u8)
	//	break
		
	//	case PACKET_REMOTE_DASH:
	//		var _dash_x = buffer_read(_buff, buffer_s16)
	//		var _dash_y = buffer_read(_buff, buffer_s16)
	//		var _dash_sprite = buffer_read(_buff, buffer_u16)
	//		var _remote_dash = instance_create_layer(_dash_x, _dash_y,"Instances", obj_remote_dash)
	//		_remote_dash.sprite_index = _dash_sprite
	//	break
	//}	