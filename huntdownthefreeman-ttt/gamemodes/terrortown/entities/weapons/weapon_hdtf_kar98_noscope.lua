AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_kar98_noscope/shared.lua", "GAME") then
    include("weapons/hdtf_kar98_noscope/shared.lua")
    AddCSLuaFile("weapons/hdtf_kar98_noscope/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Kar98 (Iron Sight)"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/k98_noscope"
    SWEP.IconLetter = "a"
end

SWEP.HoldType = "ar2"

SWEP.Primary.ClipSize      = 5
SWEP.Primary.DefaultClip   = 5
SWEP.Primary.Automatic     = false
SWEP.Primary.Ammo		  = "357"

SWEP.Primary.Damage        = 105
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