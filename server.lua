--  .oooooo.   oooo        .o8  ooooooooooooo  o8o                                       
-- d8P'  `Y8b  `888       "888  8'   888   `8  `"'                                       
--888      888  888   .oooo888       888      oooo  ooo. .oo.  .oo.    .ooooo.   .oooo.o 
--888      888  888  d88' `888       888      `888  `888P"Y88bP"Y88b  d88' `88b d88(  "8 
--888      888  888  888   888       888       888   888   888   888  888ooo888 `"Y88b.  
--`88b    d88'  888  888   888       888       888   888   888   888  888    .o o.  )88b 
-- `Y8bood8P'  o888o `Y8bod88P"     o888o     o888o o888o o888o o888o `Y8bod8P' 8""888P' 
--######################################################################################
--############################ DISCORD.GG/OLDTIMES #####################################
--######################################################################################

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPab = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_template")
ABclient = Tunnel.getInterface("vrp_template","vrp_template")
Tunnel.bindInterface("vrp_template",vRPab)


-- Start functions from here

print(Config.print)