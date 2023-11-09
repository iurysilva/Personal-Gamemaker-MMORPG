#macro PORT 45000
#macro MAX_CLIENTS 4

#macro PACKET_KEY 0
#macro PACKET_ENTITY 1
#macro PACKET_NAME 2

#macro ENTITY_X 0
#macro ENTITY_Y 1
#macro ENTITY_NAME 2
#macro ENTITY_SPRITE 3
#macro ENTITY_DESTROY 4

server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS)
buffer = buffer_create(16384, buffer_grow, 1)
clients = ds_map_create()
sockets = ds_list_create()