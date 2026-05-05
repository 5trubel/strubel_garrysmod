AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_smg1/shared.lua", "GAME") then
    include("weapons/hdtf_smg1/shared.lua")
    AddCSLuaFile("weapons/hdtf_smg1/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "MP7"
    SWEP.Slot = 2
    SWEP.Icon = "sprites/hdtf/smg1"
    SWEP.IconLetter = "a"
end

SWEP.ViewModelFOV = 54

SWEP.Primary.Ammo = "smg1"

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false