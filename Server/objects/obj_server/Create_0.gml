#macro PORT 45000
#macro MAX_CLIENTS 8

#macro PACKET_KEY 0
#macro PACKET_NAME 2
#macro PACKET_MYID 3
#macro PACKET_SPRITE 4
#macro PACKET_DASH 5

#macro PACKET_REMOTE_PLAYER 6
#macro PACKET_REMOTE_DASH 7

#macro ENTITY_X 0
#macro ENTITY_Y 1
#macro ENTITY_NAME 2
#macro ENTITY_SPRITE 3
#macro ENTITY_DESTROY 4
#macro ENTITY_MYID 5

#macro STATE_WALKING 1
#macro STATE_DASHING 2

#macro KEY_LEFT 0
#macro KEY_RIGHT 1
#macro KEY_UP 2
#macro KEY_DOWN 3

server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS)
buffer = buffer_create(16384, buffer_grow, 1)
clients = ds_map_create()
sockets = ds_list_create()