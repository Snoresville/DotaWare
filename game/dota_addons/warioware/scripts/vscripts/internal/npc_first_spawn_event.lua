local spawnedNPCs = {}
ListenToGameEvent("npc_spawned", function(keys)
	-- entindex numbers repeat after a while 
	local npc = EntIndexToHScript(keys.entindex)
	if (spawnedNPCs[keys.entindex] ~= npc) then
		spawnedNPCs[keys.entindex] = npc
		--print(npc:GetClassname())
		FireGameEvent("npc_first_spawn", {entindex = keys.entindex})
	end
end, nil)