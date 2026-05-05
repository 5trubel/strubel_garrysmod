AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_glock/shared.lua", "GAME") then
    include("weapons/hdtf_glock/shared.lua")
    AddCSLuaFile("weapons/hdtf_glock/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Glock"
    SWEP.Slot = 1
    SWEP.Icon = "sprites/hdtf/glock"
    SWEP.IconLetter = "a"
end


SWEP.Primary.Damage        = 14
SWEP.Primary.FireRate      = 0.15

-- TTT Stuff
SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
