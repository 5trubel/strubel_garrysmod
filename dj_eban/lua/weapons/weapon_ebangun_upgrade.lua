local UPGRADE = {}
UPGRADE.id = "dj_eban"
UPGRADE.class = "weapon_ebangun"
UPGRADE.name = "Диджей Ебан"
UPGRADE.desc = "1.6x урон, 1.3x разброс, да?"
UPGRADE.damageMult = 1.6
UPGRADE.spreadMult = 1.7

function UPGRADE:Apply(SWEP)
function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )

	if ( CLIENT ) then return true end

	self:Idle()

	self.BeatSound = CreateSound( self.Owner, Sound( "weapons/djeban/eban_beat_pap.wav" ) )
	if ( self.BeatSound ) then self.BeatSound:Play() end

	return true
end
end

TTTPAP:Register(UPGRADE)