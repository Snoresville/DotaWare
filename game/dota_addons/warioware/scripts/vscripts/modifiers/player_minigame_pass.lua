player_minigame_pass = player_minigame_pass or class({})

function player_minigame_pass:IsHidden() return true end

function player_minigame_pass:OnCreated()
    if IsClient() then return end

end