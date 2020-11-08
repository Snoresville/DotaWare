-- Require
require("internal/npc_first_spawn_event")

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