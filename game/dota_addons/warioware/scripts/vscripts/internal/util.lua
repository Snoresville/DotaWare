function DotaWare:TeleportLobby(unit)
    local maxRadius = 1350
    
    -- Calculate a random point which is within radius of the center
    local vCenter = Vector(0,0,0)
    local vPoint = Vector(math.random(maxRadius), 0, 0)
    local vRandomPoint = RotatePosition(vCenter, QAngle(0, self:TrueRandom(360), 0), vPoint)

    -- Teleport
    unit:SetAbsOrigin(vRandomPoint)
    FindClearSpaceForUnit(unit, vRandomPoint, false)
end

function DotaWare:TrueRandom(upperLimit)
    local randomValue = 0

    for i = 1,7 do
        randomValue = math.random(upperLimit)
        if math.random() < 0.5 then break end
    end 

    return randomValue
end