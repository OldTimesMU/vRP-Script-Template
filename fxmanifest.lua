fx_version 'adamant'
game 'gta5'

author 'OldTimes'
description 'Default Script - Write from Scratch'
version '2.0'

shared_script 'config.lua'

client_scripts{ 
    "lib/Proxy.lua",
    "lib/Tunnel.lua",
    "client.lua"
}

server_scripts{ 
    "@vrp/lib/utils.lua",
    "server.lua"
}