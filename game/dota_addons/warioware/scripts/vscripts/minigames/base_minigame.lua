require("../internal/util")
base_minigame = base_minigame or class({})

function base_minigame:Start()
    self:PlayMusic()
end

function base_minigame:PlayMusic()
    EmitGlobalSound(self:GetMusic() .. "_" .. DotaWare:GetGameSpeed())
end

function base_minigame:GetMusic()
    return "DotaWare.Stage_Destroy"
end