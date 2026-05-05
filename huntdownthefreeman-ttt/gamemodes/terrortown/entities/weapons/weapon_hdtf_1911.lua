AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_1911/shared.lua", "GAME") then
    include("weapons/hdtf_1911/shared.lua")
    AddCSLuaFile("weapons/hdtf_1911/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "M1911"
    SWEP.Slot = 1
    SWEP.Icon = "sprites/hdtf/1911"
    SWEP.IconLetter = "a"
end

SWEP.Primary.Damage        = 16
SWEP.Primary.FireRate      = 0.15


SWEP.Primary.Ammo   = "Pistol"
SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
