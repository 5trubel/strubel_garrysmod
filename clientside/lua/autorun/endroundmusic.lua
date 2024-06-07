local soundFolder = "sound/endroundmusic/"
local winningClasses = { "innocent", "traitor", "draw" }

local function PlayRandomSound()
    -- Get the winning class
    local winningClass = winningClasses[GetRoundWinner()]
    
    local soundFiles = file.Find(soundFolder .. winningClass .. "/*.wav", "GAME")

    if #soundFiles > 0 then
        local soundFile = soundFolder .. winningClass .. "/" .. soundFiles[math.random(1, #soundFiles)]
        surface.PlaySound(soundFile)
    end
end

hook.Add("TTTEndRound", "PlayEndRoundSound", PlayRandomSound)

-- Log to console
hook.Add("TTTEndRound", "LogEndRound", function()
    print("End of round.")
end)

