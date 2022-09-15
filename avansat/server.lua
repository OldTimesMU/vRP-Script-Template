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

local Template = class("Template", vRP.Extension)             	-- Numele "Class-ului", poate fi schimbat in orice
local lang = vRP.lang
function Template:__construct()                                 -- Schimba "Template" cu numele declarat mai sus (linia 15)
	vRP.Extension.__construct(self)
	
	self.cfg = module("vrp_template", "cfg/cfg")				-- Legatura cu fisierul cfg
end

Template.event = {}
Template.tunnel = {}

function Template.event:playerSpawn(user, first_spawn)
	if first_spawn then
	
		-- creating blimps/ markers 
		for k,v in pairs(self.cfg.pos) do							
			local name,gtype,x,y,z = table.unpack(v)
			
			local function enter(user)
				self.remote._openUI(source)						-- Trigger la functie client -side
			end
			
			local function leave(user)
				self.remote._closeUI(source)				    -- Trigger la functie client -side
			end
			
			local ment = clone(self.cfg.marker.Test)		    -- Preia informatia marker-ului din cfg
			ment[2].title = "Test"								-- Poate fi modificat in cfg sau in fisierul lang
			ment[2].pos = {x,y,z-1}								-- Preia x,y,z de mai sus
			
			vRP.EXT.Map.remote._addEntity(user.source, ment[1], ment[2])			-- adaugat permanent cu marker
			vRP.EXT.Map.remote._setEntity(user.source, ment[1], ment[1], ment[2])	-- poate fi sters dar nu arata marke-ul

			user:setArea("Test"..k,x,y,z,1,1.5,enter,leave)
		end
	end
end

function Template.event:test(txt)								-- functia event care trebuie chemata
	local user = vRP.users_by_source[source]
	
	vRP.EXT.Base.remote._notify(user.source, "Tunnell has worked, "..txt..".")		-- trimite notificare cu variabila
end

function Template.tunnel:test(txt)								-- functia client side de chemat
	vRP:triggerEvent("test", txt)								-- cheama eventul de la server si paseaza variabila
end

vRP:registerExtension(Template)                            		-- Schimba "Template" cu numele declarat mai sus (linia 15)
