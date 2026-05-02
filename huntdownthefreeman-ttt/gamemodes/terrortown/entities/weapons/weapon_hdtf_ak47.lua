AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_ak47/shared.lua", "GAME") then
	include("weapons/hdtf_ak47/shared.lua")
	AddCSLuaFile("weapons/hdtf_ak47/shared.lua")
end

if CLIENT then
	SWEP.PrintName = "AK-47"
	SWEP.Slot = 2
	SWEP.Icon = "sprites/hdtf/ak47"
	SWEP.IconLetter = "a"
end

SWEP.Primary.Damage        = 20


SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_revolver_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
SWEP.Primary.Ammo = "AlyxGun"


hook.Add("ScalePlayerDamage", "HDTF_ScalePlayerDamage", function(ply, hitgroup, dmginfo)
	if ply:GetActiveWeapon() == SWEP then
		local wep = ply:GetActiveWeapon()
		if wep:GetClass() == "weapon_hdtf_ak47" then
			print("Hitgroup: " .. hitgroup)
			if hitgroup == HITGROUP_HEAD then
				dmginfo:SetDamage(dmginfo:GetDamage() * 20)
			end
		end

	end
end)