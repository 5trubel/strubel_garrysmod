local soundFolder = "sound/endroundmusic/"
local winningClasses = { "innocent", "traitor", "draw" }


if ( SERVER ) then
    local queue = {}

    -- Create table for each sound for each class
    for _, class in pairs(winningClasses) do
        util.PrecacheSound(soundFolder .. class .. ".mp3")
    end
    
    -- Check if Gamemode is TTT
    if engine.ActiveGamemode() == "terrortown" then
        hook.Add ("TTTEndRound", "EndRoundMusic", function (result)
            if table.HasValue(winningClasses, result) then
                -- Add random sound to queue based on result
                table.insert(queue, soundFolder .. result .. ".mp3")
                
            end
        end)
    end
end