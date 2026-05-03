--- @ignore

CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"

CLGAMEMODESUBMENU.priority = 50
CLGAMEMODESUBMENU.title = "HDTF Random Weapon Spawns"

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "HDTF Random Weapon Spawn Settings")

    form:MakeHelp({
        label = "Configure randomization and debug output for HDTF weapon spawn normalization.",
    })

    form:MakeCheckBox({
        label = "Enable weapon spawn randomization",
        serverConvar = "hdtf_spawn_randomize",
    })

    form:MakeHelp({
        label = "If enabled, all weapon spawn types are merged into WEAPON_TYPE_RANDOM.",
    })

    form:MakeCheckBox({
        label = "Enable debug logging",
        serverConvar = "hdtf_spawn_debug",
    })

    form:MakeHelp({
        label = "Prints detailed status messages to the server console.",
    })
end
