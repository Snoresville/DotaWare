-- Spawn them in lobby
ListenToGameEvent("npc_spawned", function(keys)
    local npc = EntIndexToHScript(keys.entindex)
    if not npc:IsHero() then return end

	-- Spawns them in a random spot within the lobby
    Timers:CreateTimer(0.01, function ()
		DotaWare:TeleportLobby(npc)
	end)
end, nil)