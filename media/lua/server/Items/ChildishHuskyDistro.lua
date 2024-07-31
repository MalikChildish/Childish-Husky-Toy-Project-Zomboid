require 'Items/ProceduralDistributions'

ChildishHuskyToy = ChildishHuskyToy or {};

-- Distribution Function
function ChildishHuskyToy:addDistributions(itemsAndChances, locations)
    for item, chance in pairs(itemsAndChances)
    do
        for i, location in ipairs(locations)
        do
            if ProceduralDistributions.list[location] and ProceduralDistributions.list[location].items
            then
                table.insert(ProceduralDistributions.list[location].items, item);
                table.insert(ProceduralDistributions.list[location].items, chance);
            end
        end
    end
end

-- Check if SandboxVars and ChildishHuskyToy are defined, if not, set default values
SandboxVars = SandboxVars or {}
SandboxVars.ChildishHuskyToy = SandboxVars.ChildishHuskyToy or { SpawnRate = 1, Loot = 1 }

local sBVars = SandboxVars.ChildishHuskyToy
local SpawnRateLow = sBVars.SpawnRate * sBVars.Loot * 0.0001
local SpawnRateMid = sBVars.SpawnRate * sBVars.Loot * 0.0003
local SpawnRateHigh = sBVars.SpawnRate * sBVars.Loot * 0.0005

local plushies = {
    "Base.WestTextureSilly",
    "Base.WestTextureYellowEyes",
    "Base.WestTextureSad",
    "Base.WestTextureRedEyes",
    "Base.WestTextureMad",
    "Base.ChildishHuskyGreen",
    "Base.ChildishHuskyChildish",
    "Base.ChildishHuskyToy3D",
    "Base.ChildishHuskyToyWest"
}

local function addPlushiesWithLowSpawnRate(plushies, SpawnRateLow)
    local plushiesAndChances = {}
    for _, plushie in ipairs(plushies) do
        plushiesAndChances[plushie] = SpawnRateLow
    end
    ChildishHuskyToy:addDistributions(plushiesAndChances, {
        "KitchenRandom",
	"Antiques",
	"ClassroomDesk",
	"PetShopShelf",
	"DresserGeneric",	
    })
end

local function addPlushiesWithMidSpawnRate(plushies, SpawnRateMid)
    local plushiesAndChances = {}
    for _, plushie in ipairs(plushies) do
        plushiesAndChances[plushie] = SpawnRateMid
    end
    ChildishHuskyToy:addDistributions(plushiesAndChances, {
        "ClassroomMisc",
        "CrateRandomJunk",
        "DaycareCounter",
        "DaycareShelves",
        "GigamartSchool",
    })
end

local function addPlushiesWithHighSpawnRate(plushies, SpawnRateHigh)
    local plushiesAndChances = {}
    for _, plushie in ipairs(plushies) do
        plushiesAndChances[plushie] = SpawnRateHigh
    end
    ChildishHuskyToy:addDistributions(plushiesAndChances, {
        "CrateToys",
        "GigamartToys",
        "PrisonCellRandom",
        "WardrobeChild",
    })
end

addPlushiesWithLowSpawnRate(plushies, SpawnRateLow)
addPlushiesWithMidSpawnRate(plushies, SpawnRateMid)
addPlushiesWithHighSpawnRate(plushies, SpawnRateHigh)
