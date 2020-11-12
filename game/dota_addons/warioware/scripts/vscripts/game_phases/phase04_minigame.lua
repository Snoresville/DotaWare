MinigameList = {}
MinigameNames = {}

function DotaWare:SelectMinigame()
    --for k,v in pairs(MinigameList) do print(k,v) end

    -- Choose a minigame to run.
    MinigameList[MinigameNames[math.random(#MinigameNames)]]()
end
