-- Debug Commands
ListenToGameEvent("player_chat", function(kv)
	-- Useful key values
	local userID = kv.userid -- print("userID",userID)
	local message = kv.text -- print("message",message)
	
	if string.find(message, "-playtetris") and not GameRules:IsGamePaused() then
        StopGlobalSound("DotaWare.Lobby_Loading")
        EmitGlobalSound("DotaWare.Lobby_Loading")
        return
    end

    if string.find(message, "-stoptetris") and not GameRules:IsGamePaused() then
        StopGlobalSound("DotaWare.Lobby_Loading")
        return
    end
end, nil)