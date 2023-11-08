socket = network_create_socket(network_socket_tcp)
global.socket = socket
buffer = buffer_create(16384, buffer_grow, 1)
connect = network_connect(socket, "192.168.8.2", PORT)

if (connect < 0){
	show_message("Não foi possível se conectar ao servidor")
	game_restart()
}

entities = ds_map_create()
