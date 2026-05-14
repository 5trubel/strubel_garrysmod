local function hdtf_announce()
    local message = "[Hunt Down The Freeman TTT] Thanks for playing! The addon loaded successfully. If you need help or want to share feedback, please join our Discord!"
    print(message)
    PrintMessage(HUD_PRINTTALK, message)
end

if not file.Exists("lua/autorun/hdtf_menu.lua", "GAME") then
    local errorMessage = "[Hunt Down The Freeman TTT] Missing required file: lua/autorun/hdtf_menu.lua. Please update or reinstall the addon."
    print(errorMessage)
    game.KickAll(errorMessage)
    return
end

timer.Simple(600, function()
    if not IsValid(game.GetWorld()) then return end
    hdtf_announce()
end)