AddCSLuaFile()
/*
Original Source Code by adigram 
Original Model by Goonya / © GAnimator (Goonya Animator)
Modified and Edited by Strub3l for TTT
*/
SWEP.PrintName = "Bouncing Yaris"
SWEP.Author = "Strub3l"
SWEP.Instructions = "Why this dealer? Taking a piss!"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_EQUIP1
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.InLoadoutFor = nil
SWEP.LimitedStock = true

SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
SWEP.AutoSpawnable = false
SWEP.HoldType = "pistol"

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Weight = 7
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true

SWEP.ViewModel = "models/weapons/v_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"

if CLIENT then
	--TODO change Description if ConVars have been changed
	local desc_conVars = "Shoots a Bouncing Yaris.\n He will kill all his Friends in his way.\n"
	if (GetConVar("ttt_bouncingyaris_det_stop"):GetBool()) then
		desc_conVars = desc_conVars .. "The Detective will STOP Bouncing Yaris!\n"
	end
	if (GetConVar("ttt_bouncingyaris_det_survive"):GetBool()) then
		desc_conVars = desc_conVars .. "The Detective survives Bouncing Yaris!\n"
	end
	desc_conVars = desc_conVars .. "Explodes after " .. GetConVar("ttt_bouncingyaris_explode_time"):GetInt() .. " seconds.\n\n PS: ConVars changes wont update the description till mapchange"
	-- end desc convars
	SWEP.Icon = "ttt_bouncingyaris/ttt_icon.png"
	SWEP.EquipMenuData = {
		type = "Weapon",
		desc = desc_conVars
	}
end

function SWEP:PrimaryAttack()
	self:EmitSound("yarishonk")

	if SERVER then
		local ent = ents.Create("ttt_bouncingyaris_ent")
		if not IsValid(ent) then return end
		ent:SetPos(self:GetOwner():EyePos() + self:GetOwner():GetAimVector() * 200)
		ent:SetAngles(self:GetOwner():EyeAngles())
		ent.Owner = self:GetOwner()
		ent.SWEP = self
		math.randomseed(CurTime())
		local song = "ttt_bouncingyaris_song_01"
		if (math.random(1,10) == 1) then
			song = "ttt_bouncingyaris_song_02"
		end
		print("Playing song: " .. song)
		ent.Sound = song
		ent:Spawn()
		self:Remove()
	end
end
