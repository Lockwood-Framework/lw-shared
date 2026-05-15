-- ---------------------------------------------------------------------------
-- Crime severity and wanted level enums used by lw-legal-api, lw-crime,
-- lw-law-enforcement, lw-courts, and lw-prison.
--
-- CrimeSeverity describes how serious a violation is and determines the
-- legal pathway (fine, jail, prison, courts, death sentence).
--
-- WantedLevel is tracked per state via lw-legal-api. The enum defines the
-- levels; the state-specific wanted state is owned by lw-legal-api.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.CrimeSeverity = {
    Infraction  = 'infraction',  -- fine only; public intoxication, disturbing the peace
    Misdemeanor = 'misdemeanor', -- fine or short jail; petty theft, minor assault
    Felony      = 'felony',      -- prison time, trial eligible; robbery, serious assault
    Capital     = 'capital',     -- death sentence eligible; murder, mass violence
}

LWEnum.WantedLevel = {
    None      = 'none',      -- clean, no outstanding warrants in this state
    Suspected = 'suspected', -- lawmen are aware and watching, no warrant yet
    Wanted    = 'wanted',    -- warrant issued, arrested on sight
    Notorious = 'notorious', -- well-known criminal, larger bounty, aggressive pursuit
    Outlaw    = 'outlaw',    -- shoot on sight, maximum law enforcement response
}