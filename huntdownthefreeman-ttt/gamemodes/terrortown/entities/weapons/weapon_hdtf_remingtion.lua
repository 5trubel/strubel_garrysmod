AddCSLuaFile()

if file.Exists("lua/weapons/hdtf_shotgun/shared.lua", "GAME") then
    include("weapons/hdtf_shotgun/shared.lua")
    AddCSLuaFile("weapons/hdtf_shotgun/shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Remington 870"
    SWEP.Slot = 3
    SWEP.Icon = "sprites/hdtf/r870"
    SWEP.IconLetter = "a"
end

SWEP.Primary.Damage        = 13
SWEP.Primary.Ammo = "Buckshot"
SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false


function SWEP:GetHeadshotMultiplier(victim, dmginfo)
   local att = dmginfo:GetAttacker()
   if not IsValid(att) then return 3 end

   local dist = victim:GetPos():Distance(att:GetPos())
   local d = math.max(0, dist - 140)

   -- Decay from 2 to 1 slowly as distance increases. Note that this used to be
   -- 3+, but at that time shotgun bullets were treated like in HL2 where half
   -- of them were hull traces that could not headshot.
   return 1 + math.max(0, (1.0 - 0.002 * (d ^ 1.25)))
end

hook.Add("ScalePlayerDamage", "HDTF_ScalePlayerDamage", function(ply, hitgroup, dmginfo)
	if ply:GetActiveWeapon() == SWEP then
		local wep = ply:GetActiveWeapon()
		if wep:GetClass() == "weapon_hdtf_shotgun" then
			print("Hitgroup: " .. hitgroup)
			if hitgroup == HITGROUP_HEAD then
				dmginfo:SetDamage(dmginfo:GetDamage() * 20)
			end
		end

	end
end)