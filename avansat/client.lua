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

Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

local cvRP = module("vrp", "client/vRP")
vRP = cvRP()

local pvRP = {}
-- incarca scriptul in contextul vRP
pvRP.loadScript = module
Proxy.addInterface("vRP", pvRP)

local cfg = module("vrp_template", "cfg/cfg")            	-- Schimba vrp_template sa fie acelasi cu numele folderului

local Template = class("Template", vRP.Extension)           -- Numele sa fie similar cu cel declarat in server.lua

function Template:__construct()                            	-- Schimba "Template" cu numele clasei
	vRP.Extension.__construct(self)
end

function Template:test()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			-- task: Disable Controls
			if cfg.disable_controls then					-- cauta in cfg pentru valoare
				for k,v in pairs(cfg.disable_keys) do		-- cauta prin tabela din cfg
					if v then								-- verifica daca valoarea este adevarata
						DisableControlAction(0, k)			-- blocheaza key-urile setate "true"
					end
				end
			end
		end
	end)
end

function Template:closeUI()
	local txt = "Closed the UI"
	self.remote._test(txt)									--cheama functia de la server si paseaza variabila
end

function Template:openUI()
	local txt = "Opened the UI"
	
	self:test()												-- cheama functia interna
	self.remote._test(txt)									-- cheama functia de la server si paseaza variabila
end

Template.tunnel = {}										-- necesar pentru tunnel

-- UI
Template.tunnel.closeUI 		= Template.closeUI			-- leaga tunnel-ul la functie
Template.tunnel.openUI 			= Template.openUI			-- leaga tunnel-ul la functie

vRP:registerExtension(Template)                            	-- Schimba "Template" cu numele clasei