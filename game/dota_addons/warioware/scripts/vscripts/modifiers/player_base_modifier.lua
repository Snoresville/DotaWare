player_base_modifier = player_base_modifier or class({})

function player_base_modifier:IsHidden() return true end

function player_base_modifier:OnCreated()
    if IsClient() then return end

end

function player_base_modifier:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true,
    }
end