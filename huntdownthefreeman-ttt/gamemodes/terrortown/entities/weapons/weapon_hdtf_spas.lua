AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_spas/shared.lua", "GAME") then
	include("weapons/hdtf_spas/shared.lua")
	AddCSLuaFile("weapons/hdtf_spas/shared.lua")
end

if CLIENT then
	SWEP.PrintName = "SPAS-12"
	SWEP.Slot = 3
	SWEP.Icon = "sprites/hdtf/spas"
	SWEP.IconLetter = "a"
end

SWEP.Primary.Damage        = 18


SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

hook.Add("ScalePlayerDamage", "HDTF_ScalePlayerDamage", function(ply, hitgroup, dmginfo)
	if ply:GetActiveWeapon() == SWEP then
		local wep = ply:GetActiveWeapon()
		if wep:GetClass() == "weapon_hdtf_spas" then
			print("Hitgroup: " .. hitgroup)
			if hitgroup == HITGROUP_HEAD then
				dmginfo:SetDamage(dmginfo:GetDamage() * 20)
			end
		end

	end
end)