AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_molotov/shared.lua", "GAME") then
    include("weapons/hdtf_molotov/shared.lua")
    AddCSLuaFile("weapons/hdtf_molotov/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Molotov Cocktail"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/molotov"
    SWEP.IconLetter = "a"
end

DEFINE_BASECLASS "weapon_tttbase"
SWEP.Base = "weapon_tttbase"

SWEP.HoldType = "grenade"
 
SWEP.Primary.ClipSize      = -1
SWEP.Primary.DefaultClip   = -1
SWEP.Primary.Automatic     = false
SWEP.Primary.Delay         = 1.0
SWEP.Primary.Ammo          = "none"

SWEP.Primary.Force         = 1700
SWEP.Primary.FireRate      = 0.7
SWEP.Primary.ChargeTime    = 1.3

SWEP.SkipFirstDrawAnim = true

-- TTT Stuff
SWEP.Kind = WEAPON_NADE
SWEP.AutoSpawnable = false
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = false
SWEP.IsSilent = false
SWEP.NoSights = false 

function SWEP:Think()
	BaseClass.Think(self)
	
	-- Remove after last throw
	
	if self.Owner:GetAmmoCount( self.Primary.Ammo ) == 0 && self:GetAttackState() == 0 && self:GetNextPrimaryFire() <= CurTime()+(self.Primary.FireRate-0.2) then
		self:AutoSwitchWeapon()
		if SERVER then
			self.Weapon:Remove()
		end
	end

	-- Throw checks
	
	self:ChargeAttackThink(true)
	
	-- Draw after throw
	
	if self:GetGenericState() == 1 and self:GetNextPrimaryFire() <= CurTime()+(self.Primary.FireRate-0.5) then
        self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
		self:SetGenericState( 0 )
	end
end

function SWEP:OnRemove()
   if CLIENT and IsValid(self:GetOwner()) and self:GetOwner() == LocalPlayer() and self:GetOwner():Alive() then
      RunConsoleCommand("use", "weapon_ttt_unarmed")
   end
end