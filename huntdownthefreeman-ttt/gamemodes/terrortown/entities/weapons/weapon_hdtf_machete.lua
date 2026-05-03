AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_machete/shared.lua", "GAME") then
	include("weapons/hdtf_machete/shared.lua")
	AddCSLuaFile("weapons/hdtf_machete/shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Machete"
	SWEP.Slot = 5
	SWEP.Icon = "sprites/hdtf/machete"
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