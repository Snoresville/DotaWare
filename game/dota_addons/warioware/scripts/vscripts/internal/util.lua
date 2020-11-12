function DotaWare:TeleportLobby(unit)
    local maxRadius = 1350
    
    -- Calculate a random point which is within radius of the center
    local vCenter = Vector(0,0,0)
    local vPoint = Vector(math.random(maxRadius), 0, 0)
    local vRandomPoint = RotatePosition(vCenter, QAngle(0, math.random(256) - 1, 0), vPoint)

    -- Teleport
    unit:SetAbsOrigin(vRandomPoint)
    FindClearSpaceForUnit(unit, vRandomPoint, false)
end

function DotaWare:GetGameSpeed()
    return GAME_SPEED
end

function DotaWare:GetDurationMultiplier()
    return 1 - (self:GetGameSpeed() - 1) / 8
end