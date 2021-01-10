if SERVER then
   AddCSLuaFile( "shared.lua" )
end

if CLIENT then
   SWEP.PrintName = "Bill Nye the Jihad Guy"
   SWEP.Slot = 8
   SWEP.Icon = "vgui/ttt/billnye/billnye"
end

-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbase"

-- Standard GMod values
SWEP.HoldType = "slam"

SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 5
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false

-- Model settings
SWEP.UseHands = true
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel  = Model("models/weapons/v_c4.mdl")
SWEP.WorldModel = Model("models/weapons/w_c4.mdl")

--- TTT config values

SWEP.Kind = WEAPON_ROLE

SWEP.AutoSpawnable = false
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.InLoadoutFor = { nil }
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.NoSights = true
if CLIENT then
   SWEP.EquipMenuData = {
      type = "item_weapon",
      desc = "BILL NYE THE JIHAD GUY."
   };
end
function SWEP:Reload()
   return false
end

function SWEP:Initialize()
   util.PrecacheSound( "jihad/billnye.wav" )
   util.PrecacheSound( "jihad/explosion.wav" )
end

function SWEP:PrimaryAttack()
   self:SetNextPrimaryFire(CurTime() + 2)

   local effectdata = EffectData()
   effectdata:SetOrigin( self.Owner:GetPos() )
   effectdata:SetNormal( self.Owner:GetPos() )
   effectdata:SetMagnitude( 8 )
   effectdata:SetScale( 1 )
   effectdata:SetRadius( 20 )
   util.Effect( "Sparks", effectdata )
   self.BaseClass.ShootEffects( self )

   -- The rest is only done on the server
   if (SERVER) then
      timer.Simple(3, function() self:Asplode() end )
      self.Owner:EmitSound( "jihad/billnye.wav" )
   end
end

function SWEP:SecondaryAttack()
   self.Weapon:SetNextSecondaryFire( CurTime() + 1 )
   local TauntSound = Sound( "jihad/science.wav" )
   self.Weapon:EmitSound( TauntSound )
 end

-- Explosion properties
function SWEP:Asplode()
   local k, v

   local ent = ents.Create( "env_explosion" )
   ent:SetPos( self.Owner:GetPos() )
   ent:SetOwner( self.Owner )
   ent:SetKeyValue( "iMagnitude", "250" )
   ent:Spawn()
   ent:Fire( "Explode", 0, 0 )
   ent:EmitSound( "jihad/explosion.wav", 500, 500 )
   self:Remove()
   
   self.Owner:Kill( )
end