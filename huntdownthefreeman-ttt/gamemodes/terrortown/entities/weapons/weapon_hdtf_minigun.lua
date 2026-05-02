AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_minigun/shared.lua", "GAME") then
    include("weapons/hdtf_minigun/shared.lua")
    AddCSLuaFile("weapons/hdtf_minigun/shared.lua")
end


if CLIENT then
    SWEP.PrintName = "Minigun"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/minigun"
    SWEP.IconLetter = "v"
end

SWEP.Base = "hdtf_weapon_base"
DEFINE_BASECLASS( SWEP.Base )


SWEP.ViewModelFOV = 65
 
SWEP.Category = "Hunt Down The Freeman"
 
SWEP.Spawnable = true
 
SWEP.ViewModel  = "models/hdtf/weapons/c_minigun.mdl"
SWEP.WorldModel = "models/hdtf/weapons/w_minigun.mdl"

SWEP.HoldType = "shotgun"
 
SWEP.Primary.ClipSize      = 150
SWEP.Primary.DefaultClip   = 150
SWEP.Primary.Ammo          = "none"
SWEP.Primary.Damage        = 6


SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
