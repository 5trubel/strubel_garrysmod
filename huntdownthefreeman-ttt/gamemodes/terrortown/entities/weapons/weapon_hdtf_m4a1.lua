AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_m4a1/shared.lua", "GAME") then
	include("weapons/hdtf_m4a1/shared.lua")
	AddCSLuaFile("weapons/hdtf_m4a1/shared.lua")
end

if CLIENT then
	SWEP.PrintName = "M4A1"
	SWEP.Slot = 2
	SWEP.Icon = "sprites/hdtf/m4a1"
	SWEP.IconLetter = "a"
end

SWEP.Primary.Damage        = 13


SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
SWEP.Primary.Ammo = "Pistol"


hook.Add("ScalePlayerDamage", "HDTF_ScalePlayerDamage", function(ply, hitgroup, dmginfo)
	if ply:GetActiveWeapon() == SWEP then
		local wep = ply:GetActiveWeapon()
		if wep:GetClass() == "weapon_hdtf_m4a1" then
			print("Hitgroup: " .. hitgroup)
			if hitgroup == HITGROUP_HEAD then
				dmginfo:SetDamage(dmginfo:GetDamage() * 20)
			end
		end

	end
end)