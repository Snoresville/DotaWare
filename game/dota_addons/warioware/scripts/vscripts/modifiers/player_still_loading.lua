player_still_loading = player_still_loading or class({})

function player_still_loading:IsHidden() return true end

function player_still_loading:OnCreated()
    if IsClient() then return end
    self:StartIntervalThink(0.1)
end

function player_still_loading:OnDestroy()
    if IsClient() then return end

	local particle_aoe = "particles/units/heroes/hero_omniknight/omniknight_purification.vpcf"
    self:GetParent():EmitSound("DotaWare.Player_Ready")

	-- Add AoE particle
	local particle_aoe_fx = ParticleManager:CreateParticle(particle_aoe, PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl(particle_aoe_fx, 0, self:GetParent():GetAbsOrigin())
	ParticleManager:SetParticleControl(particle_aoe_fx, 1, Vector(400, 1, 1))
    ParticleManager:ReleaseParticleIndex(particle_aoe_fx)
end

function player_still_loading:OnIntervalThink()
    if self:GetParent():IsMoving() then
        self:Destroy()
    end
end