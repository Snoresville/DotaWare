player_minigame_pass_effect = player_minigame_pass_effect or class({})

function player_minigame_pass_effect:IsHidden() return true end

function player_minigame_pass_effect:OnCreated()
    if IsClient() then return end
    self:GetParent():EmitSound("DOTA_Item.ClarityPotion.Activate")
end

function player_minigame_pass_effect:GetEffectName()
	return "particles/items_fx/healing_clarity.vpcf"
end