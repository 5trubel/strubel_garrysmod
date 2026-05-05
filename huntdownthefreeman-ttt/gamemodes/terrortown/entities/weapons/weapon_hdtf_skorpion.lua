AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_skorpion/shared.lua", "GAME") then
    include("weapons/hdtf_skorpion/shared.lua")
    AddCSLuaFile("weapons/hdtf_skorpion/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Skorpion"
    SWEP.Slot = 2
    SWEP.Icon = "sprites/hdtf/skorpion"
    SWEP.IconLetter = "a"
end

SWEP.Primary.Ammo = "smg1"
SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false