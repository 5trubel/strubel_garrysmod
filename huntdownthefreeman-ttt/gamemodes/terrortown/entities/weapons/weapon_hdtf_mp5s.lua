AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_mp5_s/shared.lua", "GAME") then
    include("weapons/hdtf_mp5_s/shared.lua")
    AddCSLuaFile("weapons/hdtf_mp5_s/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "MP5SD"
    SWEP.Slot = 2
    SWEP.Icon = "sprites/hdtf/mp5_s"
    SWEP.IconLetter = "a"
end

SWEP.ViewModelFOV = 54

SWEP.Primary.Ammo = "smg1"

SWEP.Primary.Damage        = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false