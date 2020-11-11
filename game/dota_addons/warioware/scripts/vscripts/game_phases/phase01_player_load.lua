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

-- Function that loads the player at the first time their hero (Wisp) spawns.
ListenToGameEvent("npc_first_spawn", function(keys)
    local entindex = keys.entindex
    local entity = EntIndexToHScript(entindex)
    local playerID = entity:GetPlayerOwnerID()
    if not entity:IsHero() then return end

    print("[DotaWare] Player " .. playerID .. " has spawned for the first time in game.")

    -- Sets color of player's name to a random color
    PlayerResource:SetCustomPlayerColor( playerID, math.random(256) - 1, math.random(256) - 1, math.random(256) - 1)

    -- Adds the base modifier
    entity:AddNewModifier(entity, nil, "player_base_modifier", {})
    entity:AddNewModifier(entity, nil, "player_still_loading", {})
    
    -- Updates Scoreboard
    local steamID = PlayerResource:GetSteamID(playerID)
    CustomGameEventManager:Send_ServerToAllClients("scoreboard_add_player", {steamID = steamID, playerID = playerID})

    -- Try to turn off lingering dota music
    entity:GetPlayerOwner():SetMusicStatus(DOTA_MUSIC_STATUS_NONE, 9999)
end, nil)

CustomGameEventManager:RegisterListener("game_started", function(data)
    print("[DotaWare] Game is starting!")

    EmitGlobalSound("HeroPicker.Selected");
    StopGlobalSound("DotaWare.Lobby_Loading")

    DotaWare:Phase_Pregame()
end)