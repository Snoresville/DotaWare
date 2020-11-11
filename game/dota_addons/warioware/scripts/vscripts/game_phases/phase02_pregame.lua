function DotaWare:Phase_Pregame()
    InitialiseMode()
    CustomGameEventManager:Send_ServerToAllClients("textengine_clear", {})

    CustomGameEventManager:Send_ServerToAllClients("textengine_title", {text = "Game is starting!", color = "white", duration = 3})
    Timers:CreateTimer(3, function()
        self:Gameloop()
    end)
    
end