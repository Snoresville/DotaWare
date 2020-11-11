function InitialiseGamemode()
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
    InitialiseRandom()
    InitialiseMode()
end

function InitialiseModifiers()
    LinkLuaModifier("player_base_modifier", "modifiers/player_base_modifier", LUA_MODIFIER_MOTION_NONE)
    LinkLuaModifier("player_still_loading", "modifiers/player_still_loading", LUA_MODIFIER_MOTION_NONE)
end

function InitialiseRandom()
    print("[DotaWare] System time is: "..GetSystemTime())

    local newRandomSeed = math.random()

    for i in string.gmatch(GetSystemTime(), "%d") do
        newRandomSeed = newRandomSeed * (i + 1)
        math.randomseed(newRandomSeed)
        newRandomSeed = newRandomSeed + math.random()
    end
    --math.randomseed()
end

function InitialiseMode()
    GAME_SPEED = 1;
    GAME_ROUND = 0;
end