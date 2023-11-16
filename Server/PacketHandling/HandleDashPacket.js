import PacketTypes from "../Macros/PacketTypes.js"

export default function HandleDashPacket(server, client, packet, clients, players){
    const id = packet.id

    var data_to_send = {
        packetType: PacketTypes.DASH,
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