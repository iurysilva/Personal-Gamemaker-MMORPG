import PacketTypes from "../Macros/PacketTypes.js"

export default function HandleDisconnectionPacket(server, client, packet, clients, players){
    const id = packet.id
    delete players[id]
    delete clients[id]

    var data_to_send = {
        packetType: PacketTypes.DISCONNECTION,
        id: packet.id,
    }

    for (const clientId in clients){
        if (clientId != id) {
            server.send(JSON.stringify(data_to_send), clients[clientId].port, clients[clientId].address)
        }
    }
    console.log("Client disconnected: ", id)
    console.log("Players logged: ", players)
}