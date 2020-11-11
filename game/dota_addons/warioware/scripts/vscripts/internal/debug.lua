-- Debug Commands
ListenToGameEvent("player_chat", function(kv)
	-- Useful key values
	local userID = kv.userid -- print("userID",userID)
	local message = kv.text -- print("message",message)
    
    -- Lobby Sound
	if string.find(message, "-playtetris") and not GameRules:IsGamePaused() then
        StopGlobalSound("DotaWare.Lobby_Loading")
        EmitGlobalSound("DotaWare.Lobby_Loading")
        return
    end
    if string.find(message, "-stoptetris") and not GameRules:IsGamePaused() then
        StopGlobalSound("DotaWare.Lobby_Loading")
        return
    end

    -- Speedup Sounds
    if string.find(message, "-speedup1") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Faster_1")
        return
    end
    if string.find(message, "-speedup2") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Faster_2")
        return
    end

    -- Minigame Sounds
    if string.find(message, "-minigame1") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Minigame_1")
        return
    end
    if string.find(message, "-minigame2") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Minigame_2")
        return
    end
    if string.find(message, "-minigame3") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Minigame_3")
        return
    end

    -- Boss Stage
    if string.find(message, "-boss") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.Boss")
        return
    end

    -- Minigame Win
    if string.find(message, "-minigamewin1") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.MinigameWin_1")
        return
    end
    if string.find(message, "-minigamewin2") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.MinigameWin_2")
        return
    end
    if string.find(message, "-minigamewin3") and not GameRules:IsGamePaused() then
        EmitGlobalSound("DotaWare.MinigameWin_3")
        return
    end
end, nil)