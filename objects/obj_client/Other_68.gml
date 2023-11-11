var _event_id = async_load[? "id"]
if socket == _event_id{
	var _buff = async_load[? "buffer"]
	buffer_seek(_buff, buffer_seek_start, 0)
	var _packet_type = buffer_read(_buff, buffer_u8)
	
	switch(_packet_type){
		case PACKET_ENTITY:
			var _entity_information_type = buffer_read(_buff, buffer_u8)
			var _entity_id = buffer_read(_buff, buffer_u32)
			if !ds_map_exists(entities, _entity_id){
				var _remote_entity = instance_create_layer(0, 0, "Instances", obj_remote_entity)
				ds_map_set(entities, _entity_id, _remote_entity)
			}
			
			var _remote_entity = entities[? _entity_id]
			
			switch(_entity_information_type){
				case ENTITY_X: 
					_remote_entity.x = buffer_read(_buff, buffer_s16)
				break
				case ENTITY_Y: 
					_remote_entity.y = buffer_read(_buff, buffer_s16)
				break
				case ENTITY_SPRITE: 
					_remote_entity.sprite_index = buffer_read(_buff, buffer_u16)
				break
				case ENTITY_NAME:
					_remote_entity.name = buffer_read(_buff, buffer_string)
				break
				case ENTITY_DESTROY: 
					buffer_read(_buff, buffer_u8)
					ds_map_delete(entities, _entity_id)
					with(_remote_entity){
						instance_destroy()	
					}
				break
				case ENTITY_MYID:
					_remote_entity.my_id = buffer_read(_buff, buffer_u8)
				break
			}			
		break
		
		case PACKET_MYID:
			my_id = buffer_read(_buff, buffer_u8)
		break
	}
}