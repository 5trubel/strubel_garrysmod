AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_axe/shared.lua", "GAME") then
	include("weapons/hdtf_axe/shared.lua")
	AddCSLuaFile("weapons/hdtf_axe/shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Axe"
	SWEP.Slot = 5
	SWEP.Icon = "sprites/hdtf/axe"
	SWEP.IconLetter = "a"
end


SWEP.Kind = WEAPON_PISTOL 
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = ""
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = true
SWEP.NoSights = true
SWEP.Primary.Ammo = ""