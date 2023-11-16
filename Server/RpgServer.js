import dgram from 'dgram'
import PacketTypes from './Macros/PacketTypes.js';
import HandleConnectionPacket from './PacketHandling/HandleConnectionPacket.js';
import HandleLocationPacket from './PacketHandling/HandleLocationPacket.js';
import HandleDisconnectionPacket from './PacketHandling/HandleDisconnectionPacket.js';
import HandleDashPacket from './PacketHandling/HandleDashPacket.js';

var players = {}
var clients = {}

var server = dgram.createSocket('udp4')

server.on("message", (message, client) => {
    const packet = JSON.parse(message)
    switch (packet.packetType){
        case PacketTypes.CONNECTION:
            HandleConnectionPacket(server, client, packet, clients, players)
        break

        case PacketTypes.LOCATION:
            HandleLocationPacket(server, client, packet, clients, players)
        break

        case PacketTypes.DISCONNECTION:
            HandleDisconnectionPacket(server, client, packet, clients, players)
        break

        case PacketTypes.DASH:
            HandleDashPacket(server, client, packet, clients, players)
        break
        }
})


server.bind(45000, '127.0.0.1', () => (console.log("Server running...")))