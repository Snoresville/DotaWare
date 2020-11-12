function DotaWare:Gameloop()
    EmitGlobalSound("DotaWare.Minigame_" .. self:GetGameSpeed())
    Timers:CreateTimer(4 * self:GetDurationMultiplier(), function()
        self:SelectMinigame()
    end)
end