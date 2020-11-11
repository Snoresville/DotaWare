function DotaWare:Phase_Pregame()
    InitialiseMode()

    Timers:CreateTimer(3, function()
        self:Gameloop()
    end)
    
end