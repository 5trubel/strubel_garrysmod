AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_awp/shared.lua", "GAME") then
    include("weapons/hdtf_awp/shared.lua")
    AddCSLuaFile("weapons/hdtf_awp/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "AWP"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/awp"
    SWEP.IconLetter = "a"
end

SWEP.HoldType = "ar2"

SWEP.Primary.ClipSize      = 5
SWEP.Primary.DefaultClip   = 5
SWEP.Primary.Automatic     = false
SWEP.Primary.Ammo		  = "357"

SWEP.Primary.Damage        = 90
SWEP.Primary.SpreadADS     = Vector(0.002,0.002)
SWEP.SpreadMax = 0.010

-- TTT Stuff
SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_357_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

hook.Add("ScalePlayerDamage", "HDTF_ScalePlayerDamage", function(ply, hitgroup, dmginfo)
	if ply:GetActiveWeapon() == SWEP then
		local wep = ply:GetActiveWeapon()
		if wep:GetClass() == "weapon_hdtf_awp" then
			print("Hitgroup: " .. hitgroup)
			if hitgroup == HITGROUP_HEAD then
				dmginfo:SetDamage(dmginfo:GetDamage() * 20)
			end
		end

	end
end)