import GenerateUUID from '../Scripts/GenerateUUID.js'
import GeneratePlayer from '../Scripts/GeneratePlayer.js'
import PacketTypes from '../Macros/PacketTypes.js'

export default function HandleConnectionPacket(server, client, packet, clients, players){
    const id = GenerateUUID()
    var player = GeneratePlayer(id, packet.name, packet.sprite)
    client.id = player.id
    players[id] = player

    for (const playerId in players){
        var data_to_send = {
            packetType: PacketTypes.CONNECTION,
            id: players[playerId].id,
            x: players[playerId].x,
            y: players[playerId].y,
            name: players[playerId].name,
            sprite: players[playerId].sprite,
            isRemotePlayer: playerId === client.id ? false : true 
        }
        server.send(JSON.stringify(data_to_send), client.port, client.address)
    }
    
    for (const clientId in clients){
        var data_to_send = {
            packetType: PacketTypes.CONNECTION,
            id: player.id,
            x: player.x,
            y: player.y,
            name: player.name,
            sprite: player.sprite,
            isRemotePlayer: true
        }
        server.send(JSON.stringify(data_to_send), clients[clientId].port, clients[clientId].address)
    }

    clients[id]= client
    console.log("New Client connected: ", id)
    console.log("Players logged: ", players)
}