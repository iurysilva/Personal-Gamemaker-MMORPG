#macro PACKET_CONNECTION 0
#macro PACKET_DISCONNECTION 1
#macro PACKET_NAME 2
#macro PACKET_LOCATION 3
#macro PACKET_DASH 4

#macro KEY_LEFT 0
#macro KEY_RIGHT 1
#macro KEY_UP 2
#macro KEY_DOWN 3

socket = network_create_socket(network_socket_udp)
buffer = buffer_create(100, buffer_grow, 1)
server_address = "127.0.0.1"
server_port = 45000

data_to_send = ds_map_create()
entities = ds_map_create()
my_id = -1
target = noone

var _name = global.name == "" ? "Desconhecido" : global.name
var _initial_sprite = spr_character_still_down
scr_send_connection(_name, _initial_sprite)
