function InitialiseGamemode()
    math.randomseed(os.time())
    local gmE = GameRules:GetGameModeEntity()
    
    -- Fixed settings for the gamemode
    GameRules:SetCreepSpawningEnabled(false)
    GameRules:SetCustomGameSetupAutoLaunchDelay(1)
    GameRules:SetPreGameTime( 1 )
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 24 )
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
    GameRules:SetCustomGameAllowBattleMusic(false)
    GameRules:SetCustomGameAllowMusicAtGameStart(false)

    gmE:SetCustomGameForceHero("npc_dota_hero_wisp")
    gmE:SetFixedRespawnTime(99999)
    gmE:SetCustomHeroMaxLevel(1)
    gmE:SetDeathOverlayDisabled(true)
    gmE:SetGoldSoundDisabled(true)
    gmE:SetCameraDistanceOverride(1700)
    gmE:SetBuybackEnabled(false)
    gmE:SetAnnouncerDisabled(true)
    gmE:SetKillingSpreeAnnouncerDisabled(true)

    -- Other mechanics
    AddFOWViewer(DOTA_TEAM_GOODGUYS, Vector(0,0,0), math.sqrt(2048 * 2048 * 2), 999999, false)

    -- More Initialisation
    InitialiseModifiers()
end

function InitialiseModifiers()
    LinkLuaModifier("player_base_modifier", "modifiers/player_base_modifier", LUA_MODIFIER_MOTION_NONE)
    LinkLuaModifier("player_still_loading", "modifiers/player_still_loading", LUA_MODIFIER_MOTION_NONE)
end

-- Function that initialises the player at the first time their hero (Wisp) spawns.
ListenToGameEvent("npc_first_spawn", function(keys)
    local entindex = keys.entindex
    local entity = EntIndexToHScript(entindex)
    local playerID = entity:GetPlayerOwnerID()
    if not entity:IsHero() then return end

    print("[DotaWare] Player " .. playerID .. " has spawned for the first time in game.")

    -- Sets color of player's name to a random color
    PlayerResource:SetCustomPlayerColor( playerID, DotaWare:TrueRandom(256) - 1, DotaWare:TrueRandom(256) - 1, DotaWare:TrueRandom(256) - 1)

    -- Adds the base modifier
    entity:AddNewModifier(entity, nil, "player_base_modifier", {})
    entity:AddNewModifier(entity, nil, "player_still_loading", {})

    -- Spawns them in a random spot within the lobby
    Timers:CreateTimer(0.01, function ()
		DotaWare:TeleportLobby(entity)
	end)
    

    -- Try to turn off lingering dota music
    entity:GetPlayerOwner():SetMusicStatus(DOTA_MUSIC_STATUS_NONE, 9999)
end, nil)