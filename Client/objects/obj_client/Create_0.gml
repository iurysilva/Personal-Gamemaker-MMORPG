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

socket = network_create_socket(network_socket_tcp)
global.socket = socket
buffer = buffer_create(16384, buffer_grow, 1)
connect = network_connect(socket, "localhost", PORT)

if (connect < 0){
	show_message("Não foi possível se conectar ao servidor")
	game_restart()
}

scr_send_name(global.name == "" ? "Desconhecido" : global.name)
entities = ds_map_create()

my_id = -1
target = noone

scr_send_my_id()

past_sprite = sprite_index