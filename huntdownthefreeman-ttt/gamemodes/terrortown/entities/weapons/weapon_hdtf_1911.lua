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

SWEP.Base = "hdtf_weapon_base"
DEFINE_BASECLASS( SWEP.Base )

SWEP.ViewModel  = "models/hdtf/weapons/c_1911.mdl"
SWEP.WorldModel = "models/hdtf/weapons/w_1911.mdl"

SWEP.HoldType = "pistol"

SWEP.Primary.ClipSize      = 8
SWEP.Primary.DefaultClip   = 8
SWEP.Primary.Automatic     = false
SWEP.Primary.Ammo          = "Pistol"

SWEP.Primary.Damage        = 16
SWEP.Primary.SpreadHip     = Vector(0.005,0.005)
SWEP.Primary.SpreadADS     = Vector(0.005,0.005)
SWEP.Primary.FireRate      = 0.15

SWEP.Primary.Sound         = "HDTF_Weapon1911.Fire"

SWEP.MuzzleFlashFX = "hd_.45mm_muzzleflash"

SWEP.ShellModel = "models/hdtf/weapons/casings/45cal.mdl"
SWEP.ShellAng = Angle(0,0,90)

SWEP.MagModel = "models/hdtf/weapons/ammo_1911.mdl"
SWEP.MagBodyGroupId = 1
SWEP.MagPos = Vector(8,0,-10)
SWEP.MagTime = 0.2

-- Running

SWEP.StartRunningAnimTime = -0.05
SWEP.RunIdleAnimLoopTime = math.huge

-- Recoil

SWEP.RecoilMax = Angle(0.3, 0.6, 0)
SWEP.RecoilMin = Angle(0.2, -0.6, 0)

SWEP.ResetViewPunchBeforeFire = true

-- ADS

SWEP.SeqLastFire = "fire_last"
SWEP.SeqADSLastFire = "fire_last_iron"

SWEP.DepletedPose = "pose_depleted"
SWEP.DepletedBodygroup = ""
SWEP.DepletedStyle = 1

-- TTT Stuff
SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
