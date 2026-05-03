-- /lua/autorun/server/hdtf_replaceweaponspawns.lua
AddCSLuaFile()

local cvDebug = CreateConVar(
    "hdtf_spawn_debug",
    "0",
    FCVAR_ARCHIVE,
    "Enable debug logs for HDTF random weapon spawn normalization"
)

local cvRandomize = CreateConVar(
    "hdtf_spawn_randomize",
    "1",
    FCVAR_ARCHIVE,
    "Enable converting all weapon spawn types to WEAPON_TYPE_RANDOM"
)

local function DebugPrint(msg)
    if not cvDebug:GetBool() then
        return
    end

    print("[HDTF TTT / Random Weapon Spawn] " .. tostring(msg))
end

local function ForceRandomWeaponSpawnType(source)
    source = source or "unknown"
    DebugPrint("Normalize requested from hook: " .. source)

    if not cvRandomize:GetBool() then
        DebugPrint("Randomization disabled by hdtf_spawn_randomize")
        return
    end

    if not entspawnscript then
        DebugPrint("Abort: entspawnscript is nil")
        return
    end

    if not isfunction(entspawnscript.GetSpawns) then
        DebugPrint("Abort: entspawnscript.GetSpawns missing")
        return
    end

    if not isfunction(entspawnscript.UpdateSpawnFile) then
        DebugPrint("Abort: entspawnscript.UpdateSpawnFile missing")
        return
    end

    if not isnumber(SPAWN_TYPE_WEAPON) then
        DebugPrint("Abort: SPAWN_TYPE_WEAPON constant missing")
        return
    end

    if not isnumber(WEAPON_TYPE_RANDOM) then
        DebugPrint("Abort: WEAPON_TYPE_RANDOM constant missing")
        return
    end

    local spawns = entspawnscript.GetSpawns()
    if not istable(spawns) then
        DebugPrint("Abort: entspawnscript.GetSpawns() did not return a table")
        return
    end

    local weaponSpawns = spawns[SPAWN_TYPE_WEAPON]

    if not istable(weaponSpawns) then
        DebugPrint("Abort: no weapon spawn table found for SPAWN_TYPE_WEAPON")
        return
    end

    local spawnTypeCount = 0
    for _ in pairs(weaponSpawns) do
        spawnTypeCount = spawnTypeCount + 1
    end

    DebugPrint(
        "Found weapon spawn groups: "
            .. spawnTypeCount
            .. " (SPAWN_TYPE_WEAPON="
            .. SPAWN_TYPE_WEAPON
            .. ", WEAPON_TYPE_RANDOM="
            .. WEAPON_TYPE_RANDOM
            .. ")"
    )

    local randomSpawns = weaponSpawns[WEAPON_TYPE_RANDOM] or {}
    local changed = false
    local convertedTypes = 0
    local convertedSpawns = 0

    if istable(weaponSpawns[WEAPON_TYPE_RANDOM]) then
        DebugPrint("Existing random spawns before merge: " .. #weaponSpawns[WEAPON_TYPE_RANDOM])
    else
        DebugPrint("No existing random spawn bucket found, creating one")
    end

    for entType, entSpawns in pairs(weaponSpawns) do
        if entType == WEAPON_TYPE_RANDOM then
            DebugPrint("Skip entType " .. entType .. ": already random bucket")
            continue
        end

        if not istable(entSpawns) then
            DebugPrint("Skip entType " .. tostring(entType) .. ": spawn list is not a table")
            continue
        end

        DebugPrint("Converting entType " .. entType .. " with " .. #entSpawns .. " spawns")

        for i = 1, #entSpawns do
            randomSpawns[#randomSpawns + 1] = entSpawns[i]
        end

        weaponSpawns[entType] = nil
        convertedTypes = convertedTypes + 1
        convertedSpawns = convertedSpawns + #entSpawns
        changed = true
    end

    if not changed then
        DebugPrint("No conversion needed: all weapon spawns are already random")
        return
    end

    weaponSpawns[WEAPON_TYPE_RANDOM] = randomSpawns
    DebugPrint(
        "Converted "
            .. convertedTypes
            .. " entType groups and "
            .. convertedSpawns
            .. " spawns. Random bucket now has "
            .. #randomSpawns
            .. " spawns"
    )

    -- Persist and sync the normalized spawn setup.
    entspawnscript.UpdateSpawnFile()
    DebugPrint("Spawn file updated")

    if isfunction(entspawnscript.UpdateSpawnCountOnClients) then
        entspawnscript.UpdateSpawnCountOnClients()
        DebugPrint("Spawn count synced to clients")
    else
        DebugPrint("UpdateSpawnCountOnClients not available, skipping client sync")
    end

    DebugPrint("Normalization complete")
end

-- Run once after map load and before each round prep to keep all weapon spawns random.
hook.Add("InitPostEntity", "HDTF_ForceRandomWeaponSpawnType_Init", function()
    ForceRandomWeaponSpawnType("InitPostEntity")
end)

hook.Add("TTTPrepareRound", "HDTF_ForceRandomWeaponSpawnType_Round", function()
    ForceRandomWeaponSpawnType("TTTPrepareRound")
end)