-- lw-shared | enums/skills.lua
-- ---------------------------------------------------------------------------
-- Skill types used by lw-skills-api and all activity resources.
-- Each skill represents a distinct XP progression that unlocks mechanics
-- for that specific activity. Reputation effects (notoriety, faction standing)
-- are wholly owned by lw-reputation-api, not tracked here.
-- ---------------------------------------------------------------------------

LWEnum = LWEnum or {}
LWEnum.SkillType = {
    -- Survival & Gathering
    Hunting    = 'hunting',     -- tracking, finding, killing game
    Butchering = 'butchering',  -- processing carcasses, yield quality, usable parts
    Fishing    = 'fishing',     -- rod, net, trot lines
    Foraging   = 'foraging',    -- herbalism, seasonal plant/mushroom identification
    Cooking    = 'cooking',     -- campfire and kitchen food preparation
    Tracking   = 'tracking',    -- following trails, reading signs, locating targets

    -- Land & Resources
    Mining   = 'mining',    -- ore extraction, prospecting, gold panning
    Logging  = 'logging',   -- timber harvesting, camp equipment
    Farming  = 'farming',   -- planting, crop management, harvest
    Ranching = 'ranching',  -- cattle management, herding, breeding

    -- Crafting
    Crafting       = 'crafting',       -- base crafting with workstations
    Blacksmithing  = 'blacksmithing',  -- metalwork, tools, hardware
    Leatherworking = 'leatherworking', -- hides, saddlery, clothing components
    Gunsmithing    = 'gunsmithing',    -- weapon maintenance, modification, repair

    -- Equestrian & Transport
    Riding      = 'riding',       -- horsemanship, bonding, mounted skill
    HorseTaming = 'horse_taming', -- breaking wild horses, early bonding stages
    Driving     = 'driving',      -- wagon handling, team management, load capacity

    -- Combat
    Shooting = 'shooting', -- accuracy, handling, dead eye mechanics
    Melee    = 'melee',    -- brawling, blade, grappling

    -- Criminal
    Lockpicking = 'lockpicking', -- locks, safes, prison escape
    Stealth     = 'stealth',     -- detection radius, heat generation, shadow movement

    -- Professional
    Medicine      = 'medicine',       -- diagnosis, treatment, surgery
    Photography   = 'photography',    -- portraits, developed prints, composition
    Journalism    = 'journalism',     -- reporting, publishing, sources
    Surveying     = 'surveying',      -- land measurement, cartography
    Law           = 'law',            -- client representation, legal arguments, writs
    BountyHunting = 'bounty_hunting', -- registered and vigilante bounty mechanics

    -- Commerce & Entertainment
    Trading     = 'trading',     -- haggling, price awareness, market reading
    Gambling    = 'gambling',    -- poker, faro, dice
    Performance = 'performance', -- saloon acts, events, prize fighting
    Rodeo       = 'rodeo',       -- competitive rodeo, horse racing
}