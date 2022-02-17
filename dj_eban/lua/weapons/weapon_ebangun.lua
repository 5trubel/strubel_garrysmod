
AddCSLuaFile("entities/ent_eban_bomb.lua")
AddCSLuaFile( "effects/eban_tracer.lua" )
AddCSLuaFile( "effects/eban_bounce.lua" )

SWEP.Slot = 6
SWEP.DrawWeaponInfoBox = false

SWEP.Base = "weapon_base"
SWEP.PrintName = "DJ Eban"
SWEP.Category = "да?"
SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.Spawnable = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.ViewModelFOV = 54
SWEP.UseHands = true
SWEP.DrawAmmo = false
SWEP.HoldType = "smg"

SWEP.Primary.ClipSize = 1
SWEP.Primary.Delay = 0.1
SWEP.Primary.Damage = 10
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "eban"

game.AddAmmoType( { name = "eban" } )
if ( CLIENT ) then language.Add( "eban_ammo", "Funny Ammo" ) end

SWEP.EquipMenuData = {
	type = "item_weapon",
	desc = "Диджей Ебан"
}

SWEP.Icon = "eban/eban_icon.png"

SWEP.Kind = WEAPON_EQUIP
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.LimitedStock = true

if ( GAMEMODE.Name == "Trouble in Terrorist Town" ) then
	SWEP.Primary.Damage = 15
	SWEP.Primary.ClipSize = 1
	SWEP.Primary.DefaultClip = 1
	SWEP.Primary.ClipMax = 1

	SWEP.Slot = 6
end

function SWEP:IsEquipment() return false end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 1, "NextIdle" )
   end
   

function SWEP:Initialize()
	self:SetHoldType( self.HoldType )
end

function SWEP:PrimaryAttack()
	if ( !self:CanPrimaryAttack() ) then return end

	if ( self.Owner:IsNPC() ) then
		self:EmitSound( "weapons/djeban/eban" .. math.random( 1, 2 ) .. ".wav", 100, math.random( 60, 80 ) )
	else
		if ( self.LoopSound ) then
			self.LoopSound:ChangeVolume( 1, 0.1 )
		else
			self.LoopSound = CreateSound( self.Owner, Sound( "weapons/djeban/eban_loop.wav" ) )
			if ( self.LoopSound ) then self.LoopSound:Play() end
		end
		if ( self.BeatSound ) then self.BeatSound:ChangeVolume( 0, 0.5 ) end
	end

		if ( IsFirstTimePredicted() ) then
		
			local bullet = {}
			bullet.Num = 1
			bullet.Src = self.Owner:GetShootPos()
			bullet.Dir = self.Owner:GetAimVector()
			bullet.Spread = Vector( 0.01, 0.01, 0 )
			bullet.Tracer = 1
			bullet.Force = 5
			bullet.Damage = self.Primary.Damage
			bullet.TracerName = "eban_tracer"
			self.Owner:FireBullets( bullet )

			self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			self.Owner:SetAnimation( PLAYER_ATTACK1 )
			
			if ( GAMEMODE.Name == "Trouble in Terrorist Town" ) then
				self:TakePrimaryAmmo( 0 )
			end
		
		end
	
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

	self:Idle()
end

function SWEP:SecondaryAttack()
	self:EmitSound( "weapons/djeban/eban" .. math.random( 1, 2 ) .. ".wav", 100, math.random( 60, 80 ) )
end

function SWEP:GetHeadshotMultiplier()
	return 1
end



function SWEP:DoImpactEffect( trace, damageType )
	local effectdata = EffectData()
	effectdata:SetStart( trace.HitPos )
	effectdata:SetOrigin( trace.HitNormal + Vector( math.Rand( -0.5, 0.5 ), math.Rand( -0.5, 0.5 ), math.Rand( -0.5, 0.5 ) ) )
	util.Effect( "eban_bounce", effectdata )

	return true
end

function SWEP:FireAnimationEvent( pos, ang, event )
	return true
end

function SWEP:KillSounds()
	if ( self.BeatSound ) then self.BeatSound:Stop() self.BeatSound = nil end
	if ( self.LoopSound ) then self.LoopSound:Stop() self.LoopSound = nil end
	timer.Destroy( "eban_idle" .. self:EntIndex() )
end

function SWEP:OnRemove()
	self:KillSounds()
end

function SWEP:OnDrop()
	self:KillSounds()
end

function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )

	if ( CLIENT ) then return true end

	self:Idle()

	self.BeatSound = CreateSound( self.Owner, Sound( "weapons/djeban/eban_beat.wav" ) )
	if ( self.BeatSound ) then self.BeatSound:Play() end

	return true
end

function SWEP:Holster()
	self:KillSounds()
	return true
end

function SWEP:Think()

	if ( self:GetNextIdle() > 0 && CurTime() > self:GetNextIdle() ) then

		self:DoIdleAnimation()
		self:Idle()

	end

	if ( self.Owner:IsPlayer() && ( self.Owner:KeyReleased( IN_ATTACK ) || !self.Owner:KeyDown( IN_ATTACK ) ) ) then
		if ( self.LoopSound ) then self.LoopSound:ChangeVolume( 0, 0.1 ) end
		if ( self.BeatSound ) then self.BeatSound:ChangeVolume( 1, 0.5 ) end
	end
end

function SWEP:DoIdleAnimation()
	self:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:Idle()

	self:SetNextIdle( CurTime() + self:GetAnimationTime() )

end

function SWEP:GetAnimationTime()
	local time = self:SequenceDuration()
	if ( time == 0 && IsValid( self.Owner ) && !self.Owner:IsNPC() && IsValid( self.Owner:GetViewModel() ) ) then time = self.Owner:GetViewModel():SequenceDuration() end
	return time
end

if ( SERVER ) then return end

killicon.Add( "eban_icon", "eban/icon", color_white )

SWEP.WepSelectIcon = Material( "eban/selection.png" )

function SWEP:DrawWeaponSelection( x, y, w, h, a )
	surface.SetDrawColor( 255, 255, 255, a )
	surface.SetMaterial( self.WepSelectIcon )

	local size = math.min( w, h )
	surface.DrawTexturedRect( x + w / 2 - size / 2, y, size, size )
end