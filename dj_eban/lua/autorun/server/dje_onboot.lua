local function hdtf_announce()
    local message = "[DJ Eban] Thanks for playing! The addon loaded successfully. If you need help or want to share feedback, please join our Discord!"
    print(message)
    PrintMessage(HUD_PRINTTALK, message)
end

timer.Simple(600, function()
    if not IsValid(game.GetWorld()) then return end
    hdtf_announce()
end)