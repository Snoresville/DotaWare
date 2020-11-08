--[[
The aim of this phase is to:    
    Wait for players to load
    Players confirm their readiness through hero movement
    Once all players are ready, the host can start the game.
]]

-- Calls Player Loading phase after the first player spawns
ListenToGameEvent("npc_first_spawn", function(keys)
    local entindex = keys.entindex
    local entity = EntIndexToHScript(entindex)
    if not entity:IsHero() then return end

    if FIRST_PLAYER_LOADED == false then
        print("[DotaWare] Custom Game finds its first player.")

        FIRST_PLAYER_LOADED = true
        DotaWare:Phase_PlayerLoad()
    end
end, nil)

function DotaWare:Phase_PlayerLoad()
    EmitGlobalSound("DotaWare.Lobby_Loading")
end