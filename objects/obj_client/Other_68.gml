var event_id = async_load[? "id"]
if socket == event_id{
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0)
	var cmd = buffer_read(buff, buffer_u8)
	
	switch(cmd){
		case PACKET_ENTITY:
			var entity_information_type = buffer_read(buff, buffer_u8)
			var entity_id = buffer_read(buff, buffer_u32)
			if !ds_map_exists(entities, entity_id){
				var p = instance_create_layer(0, 0, "Instances", obj_remote_entity)
				ds_map_set(entities, entity_id, p)
			}
			
			var p = entities[? entity_id]
			
			switch(entity_information_type){
				case ENTITY_X: 
					p.x = buffer_read(buff, buffer_s16)
				break
				case ENTITY_Y: 
					p.y = buffer_read(buff, buffer_s16)
				break
				case ENTITY_SPRITE: 
					p.sprite_index = buffer_read(buff, buffer_u16)
				break
				case ENTITY_NAME:
					p.name = buffer_read(buff, buffer_string)
				break
				case ENTITY_DESTROY: 
					buffer_read(buff, buffer_u8)
					ds_map_delete(entities, entity_id)
					with(p){
						instance_destroy()	
					}
				break
			}			
		break
	}
}