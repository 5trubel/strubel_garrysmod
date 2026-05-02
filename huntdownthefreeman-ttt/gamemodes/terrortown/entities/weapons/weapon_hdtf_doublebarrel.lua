AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_doublebarrel/shared.lua", "GAME") then
    include("weapons/hdtf_doublebarrel/shared.lua")
    AddCSLuaFile("weapons/hdtf_doublebarrel/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Double Barrel Shotgun"
    SWEP.Slot = 3
    SWEP.Icon = surface.GetTextureID("sprites/hdtf/hdtf_doublebarrel")
    SWEP.IconLetter = "a"
end

SWEP.ViewModelFOV = 54

SWEP.Primary.Ammo = "Buckshot"

SWEP.Primary.Damage        = 15
SWEP.Primary.SpreadHip     = Vector(0.085,0.085)
SWEP.Primary.Force         = 3
SWEP.Primary.Num           = 6
SWEP.Primary.FireRate      = 0.40

SWEP.Secondary.FireRate    = 0.20

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