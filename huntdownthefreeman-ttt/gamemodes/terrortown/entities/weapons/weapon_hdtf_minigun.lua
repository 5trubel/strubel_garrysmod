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

SWEP.ViewModelFOV = 65
 
SWEP.Primary.ClipSize      = 150
SWEP.Primary.DefaultClip   = 150
SWEP.Primary.Ammo          = "smg1"
SWEP.Primary.Damage        = 6

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = ""
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

function SWEP:Reload()
    return false
end

function SWEP:Equip( newOwner )
    newOwner:GiveAmmo(150, self:GetPrimaryAmmoType() or "smg1", true)
	BaseClass.Equip(self, newOwner)
end
