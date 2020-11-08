function InitialiseGamemode()
    local gmE = GameRules:GetGameModeEntity()
    
    -- Fixed settings for the gamemode
    GameRules:SetCreepSpawningEnabled(false)
    GameRules:SetCustomGameSetupAutoLaunchDelay(1)
    GameRules:SetPreGameTime( 1 )

    gmE:SetCustomGameForceHero("npc_dota_hero_wisp")
    gmE:SetFixedRespawnTime(99999)
    gmE:SetCustomHeroMaxLevel(1)
    gmE:SetDeathOverlayDisabled(true)
    gmE:SetGoldSoundDisabled(true)

end