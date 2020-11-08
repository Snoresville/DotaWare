_G.DotaWare = DotaWare or class({})

-- Require
require("libraries/timers")

-- Internal
require("internal/globals")
require("internal/util")
require("internal/npc_first_spawn_event")

-- Game Phases
require("game_phases/phase01_player_load")

require("internal/init")	-- Initialise after all variables have been settled

-- Initialise Game Mode
function Precache( context )
	PrecacheResource("soundfile", "soundevents/custom_sounds.vsndevts", context)
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Activates on start
function Activate()
	InitialiseGamemode()
	
end