AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_sigxi/shared.lua", "GAME") then
    include("weapons/hdtf_sigxi/shared.lua")
    AddCSLuaFile("weapons/hdtf_sigxi/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Sig 556"
    SWEP.Slot = 2
    SWEP.Icon = surface.GetTextureID("sprites/hdtf/sig556")
    SWEP.IconLetter = "a"
end

SWEP.ViewModelFOV = 54

SWEP.Primary.Ammo = "smg1"

SWEP.Primary.Damage        = 18

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false