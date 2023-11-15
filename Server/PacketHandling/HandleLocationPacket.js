import PacketTypes from "../Macros/PacketTypes.js"

export default function HandleLocationPacket(server, client, packet, clients, players){
    const id = packet.id
    players[id].x = packet.x
    players[id].y = packet.y
    players[id].sprite = packet.sprite

    var data_to_send = {
        packetType: PacketTypes.LOCATION,
        id: packet.id,
        x: packet.x,
        y: packet.y,
        sprite: packet.sprite
    }

    for (const clientId in clients){
        if (clientId != id) {
            server.send(JSON.stringify(data_to_send), clients[clientId].port, clients[clientId].address)
        }
    }
}