AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_kar98/shared.lua", "GAME") then
    include("weapons/hdtf_kar98/shared.lua")
    AddCSLuaFile("weapons/hdtf_kar98/shared.lua")
end

if CLIENT then
    resource.AddFile("materials/sprites/hdtf_ttt/hdtf_ttt_kar98scope.vmt")

    SWEP.PrintName = "Kar98 (Scoped)"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/k98"
    SWEP.IconLetter = "a"
end

SWEP.HoldType = "ar2"

SWEP.Primary.ClipSize      = 5
SWEP.Primary.DefaultClip   = 5
SWEP.Primary.Automatic     = false
SWEP.Primary.Ammo		  = "357"

SWEP.Primary.Damage        = 135
SWEP.Primary.SpreadADS     = Vector(0.002,0.002)

-- Traitor Stuff
SWEP.EquipMenuData = {
	type = "item_weapon",
	desc = "Kar98 with Scope"
}
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.LimitedStock = true

-- TTT Stuff
SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_357_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.Slot = 6
SWEP.Spawnable = false
SWEP.IsSilent = false
SWEP.NoSights = false