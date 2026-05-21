LWEnum = LWEnum or {}

-- Reputation zones group the engine's district-level zones into 11 coarser
-- geographic regions used by lw-reputation-api and any resource that gates
-- logic on regional reputation.
--
-- Each zone is represented by the hash of its canonical district. Multi-district
-- zones nominate one canonical district; the others are mapped to it in
-- DistrictToReputationZone. This means no new hash values are introduced —
-- all zone identifiers are district hashes that already exist in LWEnum.District.
--
-- Load order: must come after zones.lua in fxmanifest.lua.

LWEnum.ReputationZone = {
    GrizzliesWest         = LWEnum.District.GrizzliesWest,   -- canonical: GrizzliesWest
    GrizzliesEast         = LWEnum.District.GrizzliesEast,   -- canonical: GrizzliesEast
    CumberlandHeartlands  = LWEnum.District.Heartlands,      -- canonical: Heartlands (NH). Also includes Cumberland (NH).
    RoanokeRidge          = LWEnum.District.roanoke,         -- canonical: roanoke
    ScarlettMeadows       = LWEnum.District.scarlettMeadows, -- canonical: scarlettMeadows
    BayouMarsh            = LWEnum.District.BayouNwa,        -- canonical: BayouNwa. Also includes BluewaterMarsh.
    BigValley             = LWEnum.District.bigvalley,       -- canonical: bigvalley
    GreatPlainsTallTrees  = LWEnum.District.greatPlains,     -- canonical: greatPlains. Also includes TallTrees.
    ChollaSpringsHennigan = LWEnum.District.ChollaSprings,   -- canonical: ChollaSprings. Also includes HennigansStead.
    GaptootRioBravo       = LWEnum.District.GaptoothRidge,   -- canonical: GaptoothRidge. Also includes RioBravo.
    Guarma                = LWEnum.District.GuarmaD,         -- canonical: GuarmaD. Also includes DiezCoronas, PuntaOrgullo.
}

-- Maps every district hash to its reputation zone's canonical hash.
-- Same pattern as DistrictToState. District key casing matches LWEnum.District exactly.
LWEnum.DistrictToReputationZone = {
    -- Ambarino
    [LWEnum.District.GrizzliesWest]   = LWEnum.ReputationZone.GrizzliesWest,
    [LWEnum.District.GrizzliesEast]   = LWEnum.ReputationZone.GrizzliesEast,

    -- New Hanover
    [LWEnum.District.Heartlands]      = LWEnum.ReputationZone.CumberlandHeartlands,
    [LWEnum.District.Cumberland]      = LWEnum.ReputationZone.CumberlandHeartlands,
    [LWEnum.District.roanoke]         = LWEnum.ReputationZone.RoanokeRidge,

    -- Lemoyne
    [LWEnum.District.scarlettMeadows] = LWEnum.ReputationZone.ScarlettMeadows,
    [LWEnum.District.BayouNwa]        = LWEnum.ReputationZone.BayouMarsh,
    [LWEnum.District.BluewaterMarsh]  = LWEnum.ReputationZone.BayouMarsh,

    -- West Elizabeth
    [LWEnum.District.bigvalley]       = LWEnum.ReputationZone.BigValley,
    [LWEnum.District.greatPlains]     = LWEnum.ReputationZone.GreatPlainsTallTrees,
    [LWEnum.District.TallTrees]       = LWEnum.ReputationZone.GreatPlainsTallTrees,

    -- New Austin
    [LWEnum.District.ChollaSprings]   = LWEnum.ReputationZone.ChollaSpringsHennigan,
    [LWEnum.District.HennigansStead]  = LWEnum.ReputationZone.ChollaSpringsHennigan,
    [LWEnum.District.GaptoothRidge]   = LWEnum.ReputationZone.GaptootRioBravo,
    [LWEnum.District.RioBravo]        = LWEnum.ReputationZone.GaptootRioBravo,

    -- Guarma
    [LWEnum.District.GuarmaD]         = LWEnum.ReputationZone.Guarma,
    [LWEnum.District.DiezCoronas]     = LWEnum.ReputationZone.Guarma,
    [LWEnum.District.PuntaOrgullo]    = LWEnum.ReputationZone.Guarma,

    -- Cut content — graceful fallback, same reasoning as DistrictToState.
    [LWEnum.District.Perdido]         = LWEnum.ReputationZone.GaptootRioBravo,
}

-- Maps each zone's canonical hash to the array of canonically adjacent zone hashes.
-- Used by lw-reputation-api's propagation engine for automatic adjacent bleed.
-- Guarma has no adjacent zones — NPC travel is the only propagation vector that reaches it.
-- CumberlandHeartlands borders reflect the combined footprint of Heartlands and Cumberland.
LWEnum.ReputationZoneAdjacency = {
    [LWEnum.ReputationZone.GrizzliesWest]         = {
        LWEnum.ReputationZone.GrizzliesEast,
        LWEnum.ReputationZone.CumberlandHeartlands,
        LWEnum.ReputationZone.BigValley,
    },
    [LWEnum.ReputationZone.GrizzliesEast]         = {
        LWEnum.ReputationZone.GrizzliesWest,
        LWEnum.ReputationZone.CumberlandHeartlands,
        LWEnum.ReputationZone.RoanokeRidge,
    },
    [LWEnum.ReputationZone.CumberlandHeartlands]  = {
        LWEnum.ReputationZone.GrizzliesEast,
        LWEnum.ReputationZone.GrizzliesWest,
        LWEnum.ReputationZone.RoanokeRidge,
        LWEnum.ReputationZone.BigValley,
        LWEnum.ReputationZone.ScarlettMeadows,
    },
    [LWEnum.ReputationZone.RoanokeRidge]          = {
        LWEnum.ReputationZone.GrizzliesEast,
        LWEnum.ReputationZone.CumberlandHeartlands,
        LWEnum.ReputationZone.BayouMarsh,
        LWEnum.ReputationZone.ScarlettMeadows,
    },
    [LWEnum.ReputationZone.ScarlettMeadows]       = {
        LWEnum.ReputationZone.CumberlandHeartlands,
        LWEnum.ReputationZone.BayouMarsh,
        LWEnum.ReputationZone.RoanokeRidge,
    },
    [LWEnum.ReputationZone.BayouMarsh]            = {
        LWEnum.ReputationZone.RoanokeRidge,
        LWEnum.ReputationZone.ScarlettMeadows,
    },
    [LWEnum.ReputationZone.BigValley]             = {
        LWEnum.ReputationZone.CumberlandHeartlands,
        LWEnum.ReputationZone.GreatPlainsTallTrees,
        LWEnum.ReputationZone.GrizzliesWest,
    },
    [LWEnum.ReputationZone.GreatPlainsTallTrees]  = {
        LWEnum.ReputationZone.BigValley,
        LWEnum.ReputationZone.ChollaSpringsHennigan,
    },
    [LWEnum.ReputationZone.ChollaSpringsHennigan] = {
        LWEnum.ReputationZone.GreatPlainsTallTrees,
        LWEnum.ReputationZone.GaptootRioBravo,
    },
    [LWEnum.ReputationZone.GaptootRioBravo]       = {
        LWEnum.ReputationZone.ChollaSpringsHennigan,
    },
    [LWEnum.ReputationZone.Guarma]                = {},
}