fx_version 'cerulean'
games { 'gta5' }

description "vRP Template Avansat"        		-- Optional
version '0.2'                         -- Optional
author 'OldTimes'

shared_script {
  "@vrp/lib/utils.lua"
}

server_script {		
    "server.lua",
	"vrp.lua"
}

client_scripts {
	'client.lua'
}

files{
	"cfg/cfg.lua"                       
}
