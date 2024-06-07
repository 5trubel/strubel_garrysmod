hook.Add("PlayerDeathSound", "DeFlatline", function() return true end)
local deathsound = Sound("gp-death.wav")
hook.Add("PlayerDeath", "NewSound", function(vic,unused1,unused2) vic:EmitSound(deathsound) end)
-- Log to console
hook.Add("PlayerDeath", "LogDeath", function(vic,unused1,unused2)
    print(vic:Nick() .. " died.")
end)