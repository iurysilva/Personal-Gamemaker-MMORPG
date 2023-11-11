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